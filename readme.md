# docker-laravel1

## local dev

- add docker compose alias below
- setup persistence folder
- $ ``cp $(pwd)/laravel/.env.example $(pwd)/persistence/.env``

## docker-compose alias

- add as alias
    ```
    function d() {
        ./docker/d "$@"
    }
    ```

## shortcuts

- $ ``d startq``
- $ ``d start``
- $ ``d stop``
- $ ``d art -V``
- $ ``d comp -V``
- $ ``d test``
- $ ``d npm -v``
- $ ``d yarn -v``
