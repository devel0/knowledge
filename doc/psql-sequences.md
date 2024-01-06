# psql sequences

## show all sequences with schema name info

```sql
select schemaname,sequencename from pg_sequences;
```

## alter sequence

```sql
alter sequence "myschema"."sequencename" RESTART WITH newval;
```