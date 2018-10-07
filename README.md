## Installation of the Docker Container in computer

#Step 1 - Build container
  - You can change "alpine3.8" to any name you want
  - `docker build -t alpine3.8 .`

#Step 2 - Run container (To use for multiple container)
  - `docker run -d --name alpine3.8 -p 8080:80 -v $(pwd)/html:/var/www/html alpine3.8:latest`

#Step 3 - Console container 
  - Need to change the name "alpine3.8" to your perference
  - `docker exec -it alpine3.8 sh`
  - `cd /var/www/html`

#Step 4 - Install Laravel 5.7
  - To be install if you are creating a new project
  - `docker exec -it alpine3.8 /var/init_laravel.sh`

#Step 5 - Browser to check if it is working correctly
  - `http://localhost:8080`