<?php

namespace App\Service;

use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
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

    public function handleTicketCreated(Ticket $ticket): array
    {
        $this->validateOptions();

        // Create ticket in Leantime.
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

        // Add note on UVdesk ticket.
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

        return [
            'response' => $response,
            'note' => $note,
        ];
    }

    public function getTicketAsArray(Ticket $ticket): array
    {
        return [
            'details' => $this->ticketService->getTicketInitialThreadDetails($ticket) ?? [],
            // Make ticket URL readily available
            'ticket_url' => $this->router->generate('helpdesk_member_ticket', [
                'ticketId' => $ticket->getId(),
            ], UrlGeneratorInterface::ABSOLUTE_URL),
            // The ticket itself
            'ticket' => $ticket,
        ];
    }

    private function renderTicketTemplate(string $name, Ticket $ticket): string
    {
        $template = $this->getTicketOptions($ticket)['templates'][$name] ?? '';
        $template = $this->twig->createTemplate($template);

        return $template->render($this->getTicketAsArray($ticket));
    }

    private function getTicketOptions(Ticket $ticket): array
    {
        return $this->options['ticket'][$ticket->getType()->getId()]
            ?? $this->options['ticket']['default'];
    }

    private function validateOptions(): array
    {
        return (new OptionsResolver())
            // note
            ->setRequired('note')
            ->setAllowedTypes('note', 'array')
            // ticket
            ->setRequired('ticket')
            ->setAllowedTypes('ticket', 'array')
            ->resolve($this->options);
    }
}
