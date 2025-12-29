# convert json to csharp

```sh
quicktype --all-properties-optional --no-enums -l schema sample-data.json -o sample-schema.json
quicktype -s schema sample-schema.json --namespace Sample -o sample-parser.cs
```

to be more strict remove flags `--all-properties-optional` and `--no-enums` in schema generation

- references : https://github.com/glideapps/quicktype