# docker local mssql

assuming `~/security/local-mssql-server` is a file within SA db password ( `~/security` must 700 perm ):

```sh
docker run \
    -e "ACCEPT_EULA=Y" \
    -e "MSSQL_SA_PASSWORD=$(cat ~/security/local-mssql-server)" \
    -p 1433:1433 \
    --name="mssql" \
    --restart unless-stopped \
    -d mcr.microsoft.com/mssql/server:2022-latest
```
