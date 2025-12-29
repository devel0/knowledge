# convert json to csharp

```sh
quicktype --all-properties-optional -l schema sample-data.json -o sample-schema.json
quicktype -s schema sample-schema.json --namespace Sample -o sample-parser.cs
```

- references : https://github.com/glideapps/quicktype