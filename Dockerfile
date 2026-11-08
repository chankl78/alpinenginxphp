# ---------------------------------------------------------------
# Versions: the only lines you need to change when upgrading.
# You can also override them at build time with --build-arg.
# ---------------------------------------------------------------
ARG PHP_VERSION=8.5.12
ARG ALPINE_VERSION=3.24
ARG COMPOSER_VERSION=2.11.1

FROM composer:${COMPOSER_VERSION} AS composer
FROM php:${PHP_VERSION}-fpm-alpine${ALPINE_VERSION}

LABEL maintainer="Chan Kuan Leang <chankl78@gmail.com>"

# Composer (from the official composer image) and the PHP extension installer
COPY --from=composer /usr/bin/composer /usr/local/bin/composer
COPY --from=mlocati/php-extension-installer:2 /usr/bin/install-php-extensions /usr/local/bin/

# PHP extensions (system libraries are installed automatically)
RUN install-php-extensions bcmath bz2 gd imagick intl mysqli pdo_mysql zip

# nginx, supervisor and dev tools
RUN apk add --no-cache nginx supervisor git curl nano npm yarn \
    && mkdir -p /var/www /var/log/supervisord

WORKDIR /var/www

COPY nginx.conf /etc/nginx/nginx.conf
COPY supervisord.conf /etc/supervisord.conf
COPY php.ini-production /usr/local/etc/php/php.ini-production
COPY php.ini-production /usr/local/etc/php/php.ini
COPY init_laravel.sh /var/init_laravel.sh
RUN chmod +x /var/init_laravel.sh

EXPOSE 80

ENTRYPOINT ["/usr/bin/supervisord", "-n", "-c", "/etc/supervisord.conf"]
