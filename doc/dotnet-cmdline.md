# dotnet cmdline

## upgrade tool package from local nuget

- a `.nupkg` file expected in local folder

```sh
dotnet tool update -g packagename --add-source ./prj/bin/Release
```

## enforce version

if having multiple dotnet sdk installed, one of `dotnet --list-sdks` can enforced in a project through creation of a `global.json` file

```json
{
  "projects": [ "src" ],
  "sdk": {
    "version": "2.2.203"
  }
}
```
