#!/bin/sh

cd /var/www/html

composer create-project --prefer-dist laravel/laravel .

rm webpack.mix.js
cp .env.example .env

php artisan key:generate

npm install
npm install cordova
npm install @vue/cli
npm install framework7-cli --unsafe-perm=true --allow-root
npm install framework7
npm install framework7-vue
