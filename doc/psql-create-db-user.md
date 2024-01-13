# psql create db user

replace `dbname`, `username` and `userpass` with your own:

```sql
CREATE DATABASE dbname;
CREATE USER username WITH ENCRYPTED PASSWORD 'userpass';
GRANT ALL PRIVILEGES ON DATABASE dbname TO username;
```
