# nuget config local packages

Sometimes you need to restore packages from specific local repository in your project.

- edit local nuget.config like this

```xml
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <packageSources>
    <add key="devel0" value="https://www.myget.org/F/devel0/api/v3/index.json" />    
    <add key="local" value="packages" />
  </packageSources>
</configuration>
```

- issueing `dotnet restore` will consume packages from `packages` folder in local project
