# readme

## build

- $ ``docker build -t huenisys/docker-app:latest -f docker/app/Dockerfile docker/app``
- $ ``docker build -t huenisys/nodejs:latest -f docker/nodejs/Dockerfile docker/nodejs``

## runs

- $ ``docker run --rm -it huenisys/docker-app:latest bash``
- $ ``docker run -d --rm -p 8080:80 -v $(pwd)/application:/var/www/html/public huenisys/docker-app:latest nginx``
- $ ``docker run -d --rm -p 8080:80 -v $(pwd)/application:/var/www/html/public huenisys/docker-app:latest supervisord``
- $ ``docker run -d --rm -p 8080:80 -v $(pwd)/application:/var/www/html/public huenisys/docker-app:latest``
- start db: $ ``docker run -d --rm --name=db -v mydata:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=laravel -e MYSQL_USER=laravel -e MYSQL_PASSWORD=secret --network=appnet mysql:5.7``
- $ ``docker run -d --rm --name=appserver --network=appnet -p 8080:80 -v $(pwd)/application:/var/www/html/public huenisys/docker-app:latest``
- prep the laravel app: $ ``docker run -it --rm --name=app --network=appnet -v $(pwd):/var/www/html -w /var/www/html huenisys/docker-app:latest composer create-project laravel/laravel application``
- start app: $ ``docker run -d --rm --name=app --network=appnet -p 80:80 -v $(pwd)/application:/var/www/html huenisys/docker-app:latest``


## notes

- docker network ls
- docker network create appnet
- docker network inspect appnet
- docker volume create mydata

```
chmod -R o+w application/storage
```
