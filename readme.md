# readme

## build

- $ ``docker build -t huenisys/docker-app:latest -f docker/Dockerfile docker``

## runs

- $ ``docker run --rm -it huenisys/docker-app:latest bash``
- $ ``docker run -d --rm -p 8080:80 -v $(pwd)/application:/var/www/html/public huenisys/docker-app:latest nginx``
- $ ``docker run -d --rm -p 8080:80 -v $(pwd)/application:/var/www/html/public huenisys/docker-app:latest supervisord``
- $ ``docker run -d --rm -p 8080:80 -v $(pwd)/application:/var/www/html/public huenisys/docker-app:latest``
- $ ``docker run -d --rm --name=mysql -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=homestead -e MYSQL_USER=homestead -e MYSQL_PASSWORD=secret --network=appnet mysql:5.7``
- $ ``docker run -d --rm --name=appserver --network=appnet -p 8080:80 -v $(pwd)/application:/var/www/html/public huenisys/docker-app:latest``


## notes

- docker network ls
- docker network create appnet
- docker network inspect appnet
