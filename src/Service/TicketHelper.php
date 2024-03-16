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
    public function __construct(
        private readonly EntityManagerInterface $entityManager,
        private readonly TicketService $ticketService,
        private readonly LeantimeApiClient $leantime,
        private readonly Environment $twig,
        private readonly UrlGeneratorInterface $router,
        private readonly array $options
    ) {
    }

    public function handleTicket(Ticket $ticket): array
    {
        $values = [
                'headline' => $this->renderTicketTemplate('headline', $ticket),
                'description' => $this->renderTicketTemplate('description', $ticket),
            ]
            + ($this->options['ticket']['values'] ?? []);

        $response = $this->leantime->addTicket($this->options['ticket']['project_id'], $values);
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
        $template = $this->twig->createTemplate($this->options['ticket']['templates'][$name]);

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
}
