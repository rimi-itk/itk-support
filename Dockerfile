FROM itkdev/php8.3-fpm:latest

USER root

# Required by uvdesk/community-skeleton
RUN <<EOF
apt-get update --yes
apt-get install --yes php-mailparse php-imap
EOF

USER deploy
