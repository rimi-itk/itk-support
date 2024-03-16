<?php

namespace App\Service;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Contracts\HttpClient\HttpClientInterface;

final class LeantimeApiClient
{
    private const API_PATH_JSONRPC = '/api/jsonrpc/';

    public function __construct(
        private readonly HttpClientInterface $client,
        private readonly array $options
    )
    {
    }

    public function getTicketUrl(int $id): string {
        return $this->options['url'].'#/tickets/showTicket/'.$id;
    }

    public function addTicket(int $projectId, array $values): array
    {
        return $this->post('leantime.rpc.tickets.addTicket', [
            'project_id' => $projectId,
            'values' => $values,
        ]);
    }

    private function post(string $method, array $params = []): array {
        $url = $this->options['url'].self::API_PATH_JSONRPC;
        $response = $this->client->request(Request::METHOD_POST, $url, [
            'headers' => [
                'x-api-key' => $this->options['api_key'],
            ],
            'json' => [
                'jsonrpc' => '2.0',
                'method' => $method,
                'id' => uniqid(),
                'params' => $params,
            ]
        ]);

        return $response->toArray();
    }
}
