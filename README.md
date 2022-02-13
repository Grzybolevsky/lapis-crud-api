# "Script Language Laboratory" Moonscript + Lapis project

## Dockerized

- Requirements for dockerized run: `docker`, `docker-compose`
- To run dockerized version of project execute: `docker-compose up`
- There is also need to configure resolver in ngnix.

## Run locally

### Introduction

- Requirements for locally run:
    - `postgres` 
      - Adjust postgres like in `db.env` file or modify `src/config.lua`.
        - I recommend to run it with docker (with following command):
          - `docker run -p 5432:5432 -e "POSTGRES_USER=user" -e "POSTGRES_PASSWORD=password" -e "POSTGRES_DB=shop" postgres`
        - or running the 1 service from docker-compose file (for example, with intelliJ).
    - `lua5.1`
    - `lapis`
    - `lua-cjson`
    - `openresty` (bundled in repo, you can install it with `install.sh` script)
- Move into`src` directory
- Execute `lapis migrate` to set up the db
- Execute `lapis server` to run server