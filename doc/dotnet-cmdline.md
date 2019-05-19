# dotnet cmdline

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