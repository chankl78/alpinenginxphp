# Creating a Laravel 5.8 with Quasar 1.05 in Docker

This is to create a development enviornment in docker container for my macbook pro, hosting laravel 5.8 with quasar 1.0.5 in alpine 3.9, nginx 1.17.1 and php 7.3.6

Most likely I will always continue to upgrade alpine, nginx & php version.

For laravel and quasar, most likely I will upgrade it thru the composer upgrade and npm for quasar.

For older version of my old dockerfile, please read "README v1.md".  It is working enviornment of my old projects


## Prerequisites
### Installation of the Docker Container into development computer
1. Refer to the below link to do the installation of dockerfile
   - https://github.com/chankl78/alpinenginxphp.git


2. Below is the steps for installing the dockerfile.  Any detail, refer the above link
   - You can change "alpine39nginx1171php736" to any name you want
      - ```docker build --no-cache -t alpine39nginx1171php736:2.0.3 .```
   - To push images and save in docker hub (For my own referennce - lazy to search web)
      - ```docker tag alpine39nginx1171php736:2.0.3 username/alpine39nginx1171php736:2.03```
      - ```docker push username/alpine39nginx1171php736:2.0.3```

3. You can proceed to Installation either using the Manual way or Automated.


## Installation (Manual)
1. git clone the laravel5.8 and quasar 1.0 into the folder of your machine using the below link
   - https://gitlab.com/chankl78/laravel5.8-quasar1.0.git


   
   ```
   git clone https://gitlab.com/chankl78/laravel5.8-quasar1.0.git .
   ```


2. Create a docker container (Refer to Prerequisites if you have not install dockerfile)
   ```
   docker run -d --name backoffice -p 8880:80 -v /usr/local/var/www/htdocs/backoffice:/var/www/html alpine39nginx1171php736:latest
   ```


3. Update Laravel to the latest version
   ```
   composer update
   cp .env.example .env
   php artisan key:generate
   ```


4. Install necessary tools into quasar folder
   ```
   cd /var/www/html/src-spa/
   npm install
   npm install -g @quasar/cli
   npm install -g @vue/cli

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


## Installation (Auto)
1. Run docker exec to install the necessary tools
```docker exec -it backoffice /var/init_laravel_quasar_setup.sh```

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
