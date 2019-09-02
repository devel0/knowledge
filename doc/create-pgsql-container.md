# create pgsql container

```sh
docker volume create pgdata
POSTGRES_PASSWORD=secret docker run --name postgres --mount source=pgdata,target=/var/lib/postgresql/data -d -p 5432:5432/tcp postgres:11.5
```

data will persist between through volume ( locally mapped to `/var/lib/docker/volumes/pgdata/_data` )

setup your `~/.pgpass` to quick access

```
*:*:*:postgres:secret
```

```sh
chmod 600 ~/.pgpass
```

and test

```sh
psql -h localhost -U postgres
```
