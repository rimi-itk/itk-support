<?php

namespace App\Command;

use App\Service\TicketHelper;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Console\Attribute\AsCommand;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Exception\InvalidArgumentException;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\Style\SymfonyStyle;
use Symfony\Component\Yaml\Yaml;
use Webkul\UVDesk\CoreFrameworkBundle\Entity\Thread;
use Webkul\UVDesk\CoreFrameworkBundle\Entity\Ticket;
use Webkul\UVDesk\CoreFrameworkBundle\Repository\TicketRepository;

#[AsCommand(
    name: 'app:ticket:created',
    description: 'Trigger the ticket created handling',
)]
class TicketCreatedCommand extends Command
{
    private readonly TicketRepository $ticketRepository;

    public function __construct(
        EntityManagerInterface $entityManager,
        private readonly TicketHelper $ticketHelper
    ) {
        parent::__construct();
        $this->ticketRepository = $entityManager->getRepository(Ticket::class);
    }

    protected function configure(): void
    {
        $this
            ->addArgument('ticket-id', InputArgument::REQUIRED, 'The ticket id')
        ;
    }

    protected function execute(InputInterface $input, OutputInterface $output): int
    {
        $io = new SymfonyStyle($input, $output);
        $id = $input->getArgument('ticket-id');

        $ticket = $this->ticketRepository->find($id);
        if (null === $ticket) {
            throw new InvalidArgumentException(sprintf('Cannot find ticket with id %s', $id));
        }

        $question = sprintf('Process ticket “%s” (#%d)?', $ticket->getSubject(), $ticket->getId());
        if ($io->confirm($question, !$input->isInteractive())) {
            /** @var array $response */
            /** @var Thread $note */
            [
                'response' => $response,
                'note' => $note,
            ] = $this->ticketHelper->handleTicketCreated($ticket);
            $io->writeln(Yaml::dump([
                'ticket' => $this->ticketHelper->getTicketAsArray($ticket),
                'response' => $response,
                'note' => [
                    'message' => $note->getMessage(),
                ],
            ]));
        }

        return Command::SUCCESS;
    }
}
