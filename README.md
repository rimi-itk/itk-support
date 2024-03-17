# ITK support

``` shell
cp ticket_handler.local.yaml.example ticket_handler.local.yaml
```

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

## Manual testing with APIs

The script [`tests/api-test`](tests/api-test) can be run to

1. test creating a couple of support tickets using UVdesk's API (cf.
   <https://github.com/uvdesk/api-bundle/wiki/Ticket-Related-APIs>) and
2. using the [Leantime API](https://docs.leantime.io/#/api/usage) to check that
   corresponsing tickets are created in Leantime:

Run the script:

``` shell
./tests/api-test
```

The scripts assumes use of [Traefik](https://doc.traefik.io/traefik/), but can
run using plain [`docker compose` port
bindings](https://docs.docker.com/reference/cli/docker/compose/port/):

``` shell
USE_TRAEFIK=0 ./tests/api-test
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

``` shell
docker run --volume ${PWD}:/code --rm pipelinecomponents/yamllint yamllint ticket_handler.local.yaml.example
```

## Code analysis

```shell
docker compose exec phpfpm composer code-analysis
```
