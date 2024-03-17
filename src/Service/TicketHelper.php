<?php

namespace App\Service;

use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;
use Twig\Environment;
use Webkul\UVDesk\CoreFrameworkBundle\Entity\Thread;
use Webkul\UVDesk\CoreFrameworkBundle\Entity\Ticket;
use Webkul\UVDesk\CoreFrameworkBundle\Services\TicketService;

class TicketHelper
{
    private readonly array $options;

    public function __construct(
        private readonly EntityManagerInterface $entityManager,
        private readonly TicketService $ticketService,
        private readonly LeantimeApiClient $leantime,
        private readonly Environment $twig,
        private readonly UrlGeneratorInterface $router,
        array $options
    ) {
        // Merge in default template options
        if ($default = ($options['ticket']['default'] ?? null)) {
            foreach ($options['ticket'] as $key => &$value) {
                $value += $default;
            }
        }
        $this->options = $options;
    }

    public function handleTicket(Ticket $ticket): array
    {
        $options = $this->getTicketOptions($ticket);
        $values = [
                'headline' => $this->renderTicketTemplate('headline', $ticket),
                'description' => $this->renderTicketTemplate('description', $ticket),
            ]
            + ($options['values'] ?? []);

        $response = $this->leantime->addTicket($options['project_id'], $values);
        $id = reset($response['result']);
        $response['ticket'] = [
            'id' => $id,
            'url' => $this->leantime->getTicketUrl($id),
        ];

        $options = $this->options['note'];
        $message = $this->twig->createTemplate(
            $options['message_template'] ?? 'Leantime URL: <a href="{{ ticket_url }}">{{ ticket_url }}</a>'
        )
            ->render([
                'ticket_url' => $this->leantime->getTicketUrl($id),
            ]);
        $note = (new Thread())
            ->setTicket($ticket)
            ->setThreadType('note')
            ->setSource($options['source'] ?? 'leantime handler')
            ->setCreatedBy($options['created_by'] ?? 'leantime handler')
            ->setIsBookmarked((bool) ($options['is_bookmarked'] ?? false))
            ->setMessage($message);
        $ticket->addThread($note);
        $this->entityManager->persist($note);
        $this->entityManager->flush();

        return $response;
    }

    private function renderTicketTemplate(string $name, Ticket $ticket): string
    {
        $template = $this->getTicketOptions($ticket)['templates'][$name] ?? '';
        $template = $this->twig->createTemplate($template);

        return $template->render(
            $this->getTicketRenderContext($ticket)
        );
    }

    private function getTicketRenderContext(Ticket $ticket): array
    {
        $context = [
            'ticket' => $ticket,
            // Make ticket URL readily available
            'ticket_url' => $this->router->generate('helpdesk_member_ticket', [
                'ticketId' => $ticket->getId(),
            ], UrlGeneratorInterface::ABSOLUTE_URL),
        ]
            + ($this->ticketService->getTicketInitialThreadDetails($ticket) ?? []);

        return $context;
    }

    private function getTicketOptions(Ticket $ticket): array
    {
        return $this->options['ticket'][$ticket->getType()?->getId()]
            ?? $this->options['ticket']['default'];
    }
}
