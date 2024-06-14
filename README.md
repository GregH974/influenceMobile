# README

For windows user with WSL

```bash
cp docker-compose-windows.override.yml docker-compose.override.yml
```


* Ruby version
    - 3.2.1

* Configuration
    - docker desktop with WSL2 on windows 11


# Installation

Build project
```bash
docker compose build
```

Start project
```bash
docker compose up
```

### Database
- creation
    ```bash
    docker compose run --rm api rails db:create
    ```

* migration
    ```bash
    docker compose run --rm api rails db:migrate
    ```

* seeds
    ```bash
    docker compose run --rm api rails db:seed
    ```

* tests

    Run the migration before
    ```bash
    docker compose run --rm api rails db:migrate RAILS_ENV=test
    ```
    Run test
    ```bash
    docker compose run --rm api rails spec
    ```

## API

http://localhost:3002/

## Client

http://localhost:3000/

## Emails

Open a new tab to receive emails:
[letter opener](http://localhost:3000/letter_opener)

## Cronjob
```bash
docker compose run --rm api rails offers:send
```

## Rubocop
```bash
docker compose run --rm api rubocop --color -E --format clang --parallel
```
## Stats
```bash
docker compose run --rm api rails stats
```

## sources
 Docker
 https://medium.com/@chris.lty07/dockerize-an-existing-react-rails-and-postgres-application-bba3d9d6b24c#
