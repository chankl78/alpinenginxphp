#!/bin/sh

cd /var/www/html

composer create-project --prefer-dist laravel/laravel .

rm package.json webpack.mix.js
cp .env.example .env

php artisan key:generate

npm install -g @quasar/cli
npm install -g @vue/cli

