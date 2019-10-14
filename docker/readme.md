# readme

## build

- $ ``docker build -t huenisys/docker-app:latest -f docker/app/Dockerfile docker/app``

## runs

- start db: $ ``docker run -d --rm --name=db -v mydata:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=laravel -e MYSQL_USER=laravel -e MYSQL_PASSWORD=secret --network=appnet mysql:5.7``

### app

- build: $ ``docker build -t huenisys/app1:latest -f docker/app/Dockerfile docker/app``
- run: $ ``docker run -it --rm --name=app -p 80:80 -v $(pwd):/home/huenisys/application huenisys/app1:latest``
- run: $``docker-compose run app bash``

### nodejs

- build: $ ``docker build -t huenisys/nodejs:latest -f docker/nodejs/Dockerfile docker/nodejs``
- run: $``docker run -it --rm --name=nodejs -v $(pwd):/home/node/application huenisys/nodejs:latest bash``
- run: $``docker-compose run nodejs bash``

## notes

- docker network ls
- docker network create appnet
- docker network inspect appnet
- docker volume create mydata

```
chmod -R o+w application/storage
```
