# huenisys/nodejs

- build: $ ``docker build -t huenisys/nodejs:latest -f docker/nodejs/Dockerfile docker/nodejs``
- run: $``docker run -it --rm --name=nodejs -v $(pwd):/home/node/application huenisys/nodejs:latest bash``
- run: $``docker-compose run nodejs bash``
