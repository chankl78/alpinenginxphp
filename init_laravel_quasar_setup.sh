#!/bin/sh

cd /var/www/html

composer update

cp .env.example .env
php artisan key:generate

php artisan key:generate

yarn global add @quasar/cli
yarn global add @quasar/icongenie
yarn global add @vue/cli
