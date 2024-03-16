<?php

namespace App\EventListener;

use App\Service\TicketHelper;
use Psr\Log\LoggerAwareTrait;
use Symfony\Component\EventDispatcher\Attribute\AsEventListener;
use Webkul\UVDesk\CoreFrameworkBundle\Workflow\Events\Ticket\Create;

#[AsEventListener(event: 'uvdesk.automation.workflow.execute')]
class TicketListener
{
    use LoggerAwareTrait;

    public function __construct(
        private readonly TicketHelper $ticketHelper
    ) {
    }

    public function __invoke(Create $event): void
    {
        try {
            $this->ticketHelper->handleTicket($event->getTicket());
        } catch (\Throwable $throwable) {
            $this->logger?->error($throwable->getMessage(), [
                'throwable' => $throwable,
            ]);
        }
    }
}
