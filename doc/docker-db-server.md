# docker db server

- [mariadb](#mariadb)
- [mysql](#mysql)
- [microsoft sql](#microsoft-sql)
- [postgres](#postgres)
- [mongodb](#mongodb)

## mariadb

```sh
docker volume create mariadb
docker run -d \
    --name mariadb \
    -v mariadb:/var/lib/mysql \
    -p 3306:3306 \
    --env MARIADB_ROOT_PASSWORD=$(cat ~/security/mariadb) \
    mariadb
```

## mysql

```sh
docker volume create mysql
docker run -d \
    --name mysql \
    -v mysql:/var/lib/mysql \
    -p 3306:3306 \
    -e MYSQL_ROOT_PASSWORD="$(cat ~/security/mysql)" \
    --restart=unless-stopped \
    mysql
```

## microsoft sql

```sh
docker run -d \
    -e "ACCEPT_EULA=Y" \
    --name mssql \
    -e "MSSQL_SA_PASSWORD=$(cat ~/security/mssql)" \
    -p 1433:1433 \
    --restart=unless-stopped \
    mcr.microsoft.com/mssql/server:2022-latest
```

## postgres

```sh
docker volume create psql

docker run -d \
    --name psql \
    -v psql:/var/lib/postgresql/data \
    -p 5432:5432 \
    -e POSTGRES_PASSWORD="$(cat ~/security/psql)" \
    --restart=unless-stopped \
    postgres

## install postgres gis
docker exec psql bash -c "apt update && apt install -y postgresql-16-postgis-3"
```

## mongodb

```sh
# mongodb (password-less)
docker run -d \
    --name mongo \
    -p 27017:27017 \
    --restart=unless-stopped \
    mongo

# or mongdb w/pass
docker run -d \
    --name mongo \
    -p 27017:27017 \
    --restart=unless-stopped \
    -e MONGO_INITDB_ROOT_USERNAME=admin \
    -e MONGO_INITDB_ROOT_PASSWORD="$(cat ~/security/mongo)" \
    mongo
```
