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
