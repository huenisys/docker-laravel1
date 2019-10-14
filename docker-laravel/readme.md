# huenisys/docker-laravel

### app

- build: $ ``docker build -t huenisys/app1:latest -f docker-laravel/app/Dockerfile docker-laravel/app``
- run: $ ``docker run -it --rm --name=app -p 80:80 -v $(pwd)/laravel:/home/huenisys/application huenisys/app1:latest``
- run: $``docker-compose run app bash``

### db

- build: $ ``docker build -t huenisys/db:latest -f docker-laravel/db.Dockerfile docker-laravel``
- run: $ ``docker run -d --rm --name=db -v dbdata:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=root -e MYSQL_DATABASE=laravel -e MYSQL_USER=laravel -e MYSQL_PASSWORD=secret --network=appnet mysql:5.7``
- run: $``docker-compose run db bash``

### nodejs

- build: $ ``docker build -t huenisys/nodejs:latest -f docker-laravel/nodejs.Dockerfile docker-laravel``
- run: $``docker run -it --rm --name=nodejs -v $(pwd)/laravel:/home/node/application huenisys/nodejs:latest bash``
- run: $``docker-compose run nodejs bash``

## notes

- docker network ls
- docker network create appnet
- docker network inspect appnet
- docker volume create mydata

```
chmod -R o+w application/storage
```
