## Installation of the Docker Container in computer

#Step 1 - Build container with the dockerfile
  - You can change "alpine3.8" to any name you want
  - `docker build -t alpine3.8 .`
  - To push images and save in docker hub
    - `docker tag alpine39nginx1171php736 username/alpine39nginx1171php736`
    - `docker push username/alpine39nginx1171php736`

#Step 2 - Run container (To use for multiple container)
  - `docker run -d --name alpine3.8 -p 8080:80 -v $(pwd)/html:/var/www/html alpine3.8:latest`

#Step 3 - Console container 
  - Need to change the name "alpine3.8" to your perference
  - `docker exec -it alpine3.8 sh`
  - `cd /var/www/html`

#Step 4 - Run the following code in the container
  - to install bash and libpng-dev for successful installation of yarn
  - `docker exec -it alpine3.8 sh`
  - `apk --no-cache add make bash g++ zlib-dev libpng-dev`
  - `exit`
  - Follow Step 5 point 3 for file installation

#Step 5 - Install Laravel 5.7
  - To be install if you are creating a new project
  - `docker exec -it alpine3.8 /var/init_laravel.sh`
  - `docker exec -it alpine3.8 /var/init_laravellumen.sh` with Laravel Lumen
  - `docker exec -it alpine3.8 /var/init_laravelcleartemplatel.sh` with clear admin template

#Step 6 - Browser to check if it is working correctly
  - `http://localhost:8080`

## TO PROCEED IF ONLY YOU WANT TO USE Clear Admin Template
#Step 7 - Copy the clear admin template files inside the laravel folder
  - Copy the correct files from clear 4.4
  - So that all the necessary npm will be downloaded correctly

#Step 8 - Install Yarn, follow by npm
  - `docker exec -it alpine3.8 sh`
  - `yarn install`
  - `npm run production`
  - Please note that when using `npm run dev`, the .map errors appears. So use .production to solve the error.