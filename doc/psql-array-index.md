# psql array index

## ef core indexing for array using gist

HasMethod specify `gin` over default `btree`

```csharp
builder.Entity<Contact>().HasIndex(x => x.array_test).HasMethod("gin");
```

## ef core querying array

```csharp
var A = new[] { "sample" };
var qx = ctx.Contacts.Where(r => r.array_test.All(y => A.Contains(y)))
    .ToList();
```

produce follows

```
info: Microsoft.EntityFrameworkCore.Database.Command[20101]
      Executed DbCommand (10ms) [Parameters=[@__A_0='System.String[]' (DbType = Object)], CommandType='Text', CommandTimeout='30']
      SELECT c.id, c.alias, c.array_test, c.city, ...
      FROM contact AS c
      WHERE (c.array_test <@ @__A_0)
```

## testing indexing

follow search "sample" in array_test string array

```sql
explain SELECT *
      FROM contact AS c
      WHERE (c.array_test <@ array['sample'])
```

results ( see *Index Cond* )
```
QUERY PLAN
Bitmap Heap Scan on contact c  (cost=20.00..24.01 rows=1 width=280)
  Recheck Cond: (array_test <@ '{sample}'::text[])
  ->  Bitmap Index Scan on "IX_contact_array_test"  (cost=0.00..20.00 rows=1 width=0)
        Index Cond: (array_test <@ '{sample}'::text[])
```

 if Index Cond not visibile may optimizer prefer seq check due to
 
 ```sql
 select name,setting from pg_settings where name like '%cost';
 ```
 
 for test purpose retry with `set enable_seqscan=off;` to force index over seq scan
