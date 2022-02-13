import config from require "lapis.config"

config "production", -> 
    num_workers 8
    code_cache "on"
    postgres ->
        backend "pgmoon"
        host "127.0.0.1"
        port "5432"
        user "user"
        password "password"
        database "shop"

config "development", ->
    num_workers 1
    code_cache "off"
    postgres ->
        backend "pgmoon"
        host "127.0.0.1"
        port "5432"
        user "user"
        password "password"
        database "shop"

config "docker", ->
    num_workers 1
    code_cache "off"
    postgres ->
        backend "pgmoon"
        host "postgres"
        port "5432"
        user "user"
        password "password"
        database "shop"

