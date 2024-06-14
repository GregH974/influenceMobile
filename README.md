# README

* Ruby version
    - 3.2.1

* React version
    - 18

* Configuration
    - docker desktop with WSL2 on windows 11


# Installation

For windows user with WSL

```bash
cp docker-compose-windows.override.yml docker-compose.override.yml
```

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

## Project links

#### API

http://localhost:3002/

#### Client

http://localhost:3000/

## Rubocop
```bash
docker compose run --rm api rubocop --color -E --format clang --parallel
```

