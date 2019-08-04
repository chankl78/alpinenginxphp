#!/bin/sh

cd /var/www/html

composer create-project --prefer-dist laravel/laravel .

rm package.json webpack.mix.js
cp .env.example .env

php artisan key:generate

npm install
npm install -g @vue/cli
npm install -g framework7
npm install -g framework7-vue
