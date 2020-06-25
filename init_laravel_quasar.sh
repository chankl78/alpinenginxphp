#!/bin/sh

cd /var/www/html

composer create-project --prefer-dist laravel/laravel .

composer require arcanedev/log-viewer:~7.0.0
composer require laravel/telescope
composer require laravel/passport

rm package.json webpack.mix.js yarn.lock
cp .env.example .env

php artisan key:generate

npm install -g @quasar/cli
npm install -g @quasar/icongenie
npm install -g vue

yarn

