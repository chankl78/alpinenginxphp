#!/bin/sh

cd /var/www/html

composer update

composer require arcanedev/log-viewer:~7.0.0
composer require laravel/telescope
composer require laravel/passport

cp .env.example .env
php artisan key:generate

yarn global add @quasar/cli
yarn global add @quasar/icongenie
yarn global add @vue/cli
