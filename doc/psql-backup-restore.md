# postgres backup restore

## backup

```sh
pg_dump dbname > file.sql
```

## restore

- drop and recreate target db first

```sh
cat file.sql | psql -h host -U postgres dbname
```
