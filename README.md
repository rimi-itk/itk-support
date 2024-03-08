# ITK support

``` shell
docker compose pull
docker compose up --build --detach
docker compose exec phpfpm composer install
```

See <https://github.com/uvdesk/community-skeleton?tab=readme-ov-file#installation> for details.

``` shell
docker compose exec phpfpm php bin/console uvdesk:configure-helpdesk
```
