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
