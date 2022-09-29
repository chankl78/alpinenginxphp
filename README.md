# Creating a Laravel 8.* with Framework7 or Quasar Framework in Docker

This is to create a development enviornment in docker container for my macbook pro, hosting laravel 8.* with quasar 1.* or framework7 in alpine, nginx and php

Most likely I will always continue to upgrade alpine, nginx & php version.

For laravel and quasar or framework7, most likely I will upgrade it thru the composer upgrade and npm for quasar.

For older version of my old dockerfile, please read "README v1.md".  It is working enviornment of my old projects


## Prerequisites
### Installation of the Docker Container into development computer
1. Refer to the below link to do the installation of dockerfile
   - https://github.com/chankl78/alpinenginxphp.git


2. Below is the steps for installing the dockerfile.  Any detail, refer the above link
   - You can change "alpine315nginx1215php812" to any name you want
      - ```docker build --no-cache -t alpine316nginx1231php8110:1.0.0 .```
   - To push images and save in docker hub (For my own referennce - lazy to search web)
      - ```docker tag alpine316nginx1231php8110:1.0.0 username/alpine316nginx1231php8110:1.0.0```
      - ```docker push username/alpine316nginx1231php8110:1.0.0```
   - To start the docker container automatically
      - ```docker update --restart=always [CONTAINER]```

3. You can proceed to Installation either using the Manual way or Automated.  Select using Framework7 or Quasar Framework

## Installation (Manual) for Framework7
1. Create a docker container (Refer to Prerequisites if you have not install dockerfile)
   ```
   docker run -d --name backofficev2 -p 8880:80 -v /usr/local/var/www/htdocs/backofficev2:/var/www/html username/alpine316nginx1231php8110:1.0.0
   ```

2. Install Laravel to the latest version
   ```
   cd /var/www/html/

   composer create-project --prefer-dist laravel/laravel .
   rm webpack.mix.js
   cp .env.example .env
   php artisan key:generate
   ```

3. Install necessary tools
   ```
   cd /var/www/html/

   npm install
   npm install cordova
   npm install @vue/cli
   npm install framework7-cli --unsafe-perm=true --allow-root
   npm install framework7
   npm install framework7-vue
   ```


## Installation (Auto) for Framework7
1. Create a docker container (Refer to Prerequisites if you have not install dockerfile)
   ```
   docker run -d --name backofficev2 -p 8880:80 -v /usr/local/var/www/htdocs/backofficev2:/var/www/html alpine316nginx1231php8110:1.0.0
   ```

2. Run docker exec to install the necessary tools
   ```
   docker exec -it backofficev2 /var/init_laravel_1stinstall_framework7.sh
   ```


## Installation (Manual) for Quasar Framework
1. git clone the laravel5.8 and quasar 1.0 into the folder of your machine using the below link
   - https://gitlab.com/chankl78/laravel5.8-quasar1.0.git


   
   ```
   git clone https://gitlab.com/chankl78/laravel5.8-quasar1.0.git .
   ```


2. Create a docker container (Refer to Prerequisites if you have not install dockerfile)
   ```
   docker run -d --name backoffice -p 8880:80 -v /usr/local/var/www/htdocs/backoffice:/var/www/html alpine316nginx1231php8110:1.0.0
   ```


3. Update Laravel to the latest version
   ```
   composer update
   cp .env.example .env
   php artisan key:generate
   ```


4. Install necessary tools into quasar folder
   ```
   npm install -g @quasar/cli
   npm install -g @quasar/icongenie
   npm install -g vue

   quasar c
   quasar b
   ```


5. Run the application
   ```
   cd /var/www/html/src-spa/
   quasar dev
   ```
   Open browser http://127.0.0.1:8882/live
      - To change the "live" name, you can edit it in quasar.conf.js under the "build"
      - change it before you run `quasar dev`


## Installation (Auto) for Quasar Framework 
1. Run docker exec to install the necessary tools
```docker exec -it backoffice /var/init_laravel_quasar.sh```

2. Run the application
   ```
   docker exec -it backoffice sh
   cd /var/www/html/src-spa/
   quasar dev
   ```
   Open browser http://127.0.0.1:8882/live
      - To change the "live" name, you can edit it in quasar.conf.js under the "build"
      - change it before you run `quasar dev`

## Special Thanks

https://github.com/isunja - For helping me.

Below is the git file which he had created and I used to modify.


https://github.com/isunja/alpinenginxphp


https://github.com/isunja/laravel5.8-quasar1.0


## Laravel License

The Laravel framework is open-sourced software licensed under the MIT license.

## Quasar License

Copyright (c) 2015-present Razvan Stoenescu MIT License

## Framework7 License
The MIT License (MIT)
Copyright (c) 2014 Vladimir Kharlampidi