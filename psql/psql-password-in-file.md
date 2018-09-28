# psql password in file

- create a `~/.pgpass` with 600 mode containing

```
hostname:5432:*:postgres:pass
```

format is `hostname:port:database:username:password` ( [ref](https://www.postgresql.org/docs/9.3/static/libpq-pgpass.html) )

to connect using `psql -h hostname -U postgres [dbname]` without supply auth
