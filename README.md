# ITK support

```shell
docker compose pull
docker compose up --build --detach
docker compose exec phpfpm composer install
```

## UVdesk

See <https://github.com/uvdesk/community-skeleton?tab=readme-ov-file#installation> for details.

```shell
docker compose exec phpfpm php bin/console uvdesk:configure-helpdesk
```

```shell
open "http://$(docker compose port nginx 8080)/en/member/login"
```

```shell
open "http://itk-support.local.itkdev.dk/en/member/login"
```

Sign in as `admin@example.com` with password `password`.

<http://itk-support.local.itkdev.dk/da/customer/login>

`user@example.com`
`password!`

### API

<https://github.com/uvdesk/api-bundle/wiki/Ticket-Related-APIs>

``` shell
curl "http://itk-support.local.itkdev.dk/api/v1/ticket" \
   --header "content-type: application/json" \
   --header "authorization: Basic PQYOHLICS3FXVLM2F1SBNXEYJZOCOLZCXNHIO4TQVMW040VM6XQT2BADNSIHESRC" \
   --data @- <<'JSON'
{
 "name": "Test user",
 "from": "user@example.com",
 "actAsType": "customer",
 "subject": "Test ticket",
 "message": "This is a test ticket created via the UVdesk API"
}
JSON
```

### Email

``` shell
docker compose exec phpfpm php bin/console swiftmailer:email:send --from=admin@example.com --to=user@example.com --subject=Test --body='Message body' --ansi --mailer=dev
```

```shell
mysqldump --host=$(docker compose port mariadb 3306 | cut -d: -f1) --port=$(docker compose port mariadb 3306 | cut -d: -f2) --user=db --password=db db > .docker/dumps/uvdesk/db.sql
```

``` shell
docker compose down && docker compose up --detach --force-recreate --remove-orphans
```

## Leantime

```shell
open "http://$(docker compose port leantime 80)"
```

```shell
open "http://leantime.itk-support.local.itkdev.dk"
```

Sign in as `admin@example.com` with password `password`.

```shell
mysqldump --host=$(docker compose port leantime-db 3306 | cut -d: -f1) --port=$(docker compose port leantime-db 3306 | cut -d: -f2) --user=db --password=db db > .docker/dumps/leantime/db.sql
```

Talk to Leantime:

``` shell
docker compose exec leantime bin/leantime
```

<https://docs.leantime.io/#/api/usage>

``` shell
curl "http://$(docker compose port leantime 80)/api/jsonrpc" \
   --header "content-type: application/json" \
   --header "x-api-key: lt_PWHdzymA1ww23qUjxxvFvNKYLbQn5ul5_z2bcwjnCWz8bP1niLI4wAehq6cI1fWA9" \
   --data @- <<'JSON'
{
 "jsonrpc": "2.0",
 "method": "leantime.rpc.projects.getAll",
 "id": "test",
 "params": {}
}
JSON
```

## Coding standards

```shell
docker compose exec phpfpm composer coding-standards-check
```

```shell
docker compose exec phpfpm composer coding-standards-apply
```

```shell
docker compose run --rm node yarn install
docker compose run --rm node yarn coding-standards-check
```

```shell
docker compose run --rm node yarn coding-standards-apply
```

## Code analysis

```shell
docker compose exec phpfpm composer code-analysis
```
