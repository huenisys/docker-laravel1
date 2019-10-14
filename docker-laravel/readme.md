# huenisys/docker-laravel

### app

- build: $ ``docker build -t huenisys/app1-laravel:latest -f docker-laravel/app/app1-laravel.Dockerfile docker-laravel/app``
- run: $ ``docker run -d --rm --name=app -p 80:80 -v $(pwd)/storage:/home/huenisys/application/storage -v $(pwd)/laravel:/home/huenisys/application huenisys/app1-laravel:latest``
- dc: $``docker-compose run app bash``

### db

- build: $ ``docker build -t huenisys/db-laravel:latest -f docker-laravel/db-laravel.Dockerfile docker-laravel``
- run: $ ``docker run -it --rm --name=db -v dbdata:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=secret -e MYSQL_DATABASE=laravel -e MYSQL_USER=laravel -e MYSQL_PASSWORD=secret huenisys/db-laravel:latest mysql -u root -p``
- dc: $``docker-compose run db mysql -u root -p``

### cache

- build: $ ``docker build -t huenisys/cache-laravel:latest -f docker-laravel/cache-laravel.Dockerfile docker-laravel``
- run: $ ``docker run -it --rm --name=cache -v cachedata:/data huenisys/cache-laravel:latest sh``
- dc: $``docker-compose run cache sh``

### nodejs

- build: $ ``docker build -t huenisys/nodejs-laravel:latest -f docker-laravel/nodejs-laravel.Dockerfile docker-laravel``
- run: $``docker run -it --rm --name=nodejs -v $(pwd)/laravel:/home/node/application huenisys/nodejs-laravel:latest bash``
- dc: $``docker-compose run nodejs bash``

## notes

- docker network ls
- docker network create appnet
- docker network inspect appnet
- docker volume create mydata

```
chmod -R o+w application/storage
```
