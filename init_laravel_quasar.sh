#!/bin/sh

cd /var/www/html

composer create-project --prefer-dist laravel/laravel .

rm -rf package.json webpack.mix.js yarn.lock resources/assets

npm install -g @vue/cli