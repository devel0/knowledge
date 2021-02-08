# troubleshoot

*[development tools](../README.md#development-tools)*

## issue

installing some packages

```
Package 'NameOfPackage' is incompatible with 'all' frameworks in project
```

solve by clean nuget cache

```sh
dotnet nuget locals all -c
```

this results in clear of

- NuGet HTTP cache: $HOME/.local/share/NuGet/v3-cache
- NuGet global packages folder: $HOME/.nuget/packages/
- NuGet Temp cache: /tmp/NuGetScratch
- NuGet plugins cache: HOME/.local/share/NuGet/plugins-cache

may you can try to clear only temp cache before to opt for an entire clean in order to avoid redownload of all needed packages.
