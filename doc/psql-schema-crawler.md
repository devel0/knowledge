# psql schema crawler

- download latest release from [repo](https://github.com/schemacrawler/SchemaCrawler/releases/) and unpack into `/opt/schemacrawler`

- make the script executable

```sh
chmod +x /opt/schemacrawler/_schemacrawler/schemacrawler.sh
```

- create follow `gen-db-dia.sh` into your project folder

```sh
#!/bin/bash

exdir=$(dirname $(readlink -f "$BASH_SOURCE"))

DST="$exdir"/doc/db
DBHOST=somedb.local
DBNAME=somedbname

if [ ! -e "$DST" ]; then
    echo "expecting destination folder [$DST]"
    exit 0
fi

cd "$DST"

SC_GRAPHVIZ_OPTS='-Granksep=2' /opt/schemacrawler/_schemacrawler/schemacrawler.sh \
    --log-level=INFO \
    --portable-names \
    --sort-columns \
    --exclude-columns='public.(__EFMigrationsHistory|othertoexclude).*' \
    --server=postgresql \
    --command=schema \
    --host=$DBHOST \
    --user=postgres \
    --password=$(cat ~/.pgpass | grep $DBHOST | awk -F ':' '{print $5}') \
    --database=$DBNAME \
    -o=db.png \
    --outputformat=png \
    --info-level=standard

cd "$exdir"
```
