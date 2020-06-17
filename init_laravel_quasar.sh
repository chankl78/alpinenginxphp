#!/bin/sh

cd /var/www/html

composer create-project --prefer-dist laravel/laravel .

composer require arcanedev/log-viewer:~7.0.0
composer require laravel/telescope

rm package.json webpack.mix.js yarn.lock
cp .env.example .env

php artisan key:generate

yarn global add @quasar/cli
yarn global add @quasar/icongenie
yarn global add @vue/cli

yarn

