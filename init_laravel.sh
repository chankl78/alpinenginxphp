#!/bin/sh

cd /var/www/html

apk --no-cache add make bash g++ zlib-dev libpng-dev
composer create-project --prefer-dist laravel/laravel .
