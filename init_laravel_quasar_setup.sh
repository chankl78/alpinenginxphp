#!/bin/sh

cd /var/www/html

git clone https://gitlab.com/chankl78/laravel5.8-quasar1.0.git .

composer update

cp .env.example .env
php artisan key:generate

cd /var/www/html/src-spa/

npm install
npm install -g @quasar/cli
npm install -g @vue/cli

quasar c
quasar b
