# select date timezone

*psql*

- assuming datetime stored without time zone ( ie. UTC )

- to retrieve datetime as local 'Europe/Rome'

```sql
select ((document_date at time zone 'UTC') at time zone 'Europe/Rome') from document
```
