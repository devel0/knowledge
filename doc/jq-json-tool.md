# jq json tool

## replace data

- `appsettings.json` example

```json
{
  "Logging": {
    "LogLevel": {
      "Default": "Information"
    }
  }  
}
```

- `cat appsettings.json | jq '.Logging.LogLevel.Default |= "Debug"'`

```json
{
  "Logging": {
    "LogLevel": {
      "Default": "Debug"
    }
  },
  "AllowedHosts": "*"
}
```

## extract data example 1

```json
[{"name":"bathroom","value":18.250000},{"name":"lab","value":17.187500},{"name":"external","value":0.000000},{"name":"bedroom","value":14.937500},{"name":"livingroom","value":17.500000}]
```

query:
```sh
cat data | jq -r '.[] | select(.name=="lab")'
```

result:
```json
{
  "name": "lab",
  "value": 17.1875
}
```

query:
```sh
cat data | jq -r '.[] | select(.name=="lab") | .value'
```

result:
```json
17.1875
```
