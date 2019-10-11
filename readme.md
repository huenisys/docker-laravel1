# readme

## build

- $ ``docker build -t huenisys/docker-app:latest -f docker/Dockerfile docker``

## runs

- $ ``docker run --rm -it huenisys/docker-app:latest bash``
- $ ``docker run -d --rm -p 8080:80 -v $(pwd)/application:/var/www/html/public huenisys/docker-app:latest nginx``
- $ ``docker run -d --rm -p 8080:80 -v $(pwd)/application:/var/www/html/public huenisys/docker-app:latest supervisord``

```
RUN ls -sf /dev/stdout /var/log/nginx/access.log \
  && ln -sf /dev/stderr /var/log/nginx/error.log
```
