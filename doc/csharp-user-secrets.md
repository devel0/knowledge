# csharp user secrets

## scenario

```cs
services
    .Remove<DbContextOptions<ApplicationDbContext>>()
    .AddDbContext<ApplicationDbContext>((sp, options) =>
        options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection"),
            builder => builder.MigrationsAssembly(typeof(ApplicationDbContext).Assembly.FullName)));
```

within `appsettings.json`:

```json
{
  "UseInMemoryDatabase": false, // Application.IntegrationTests are not designed to work with InMemory database.
  "ConnectionStrings": {
    "DefaultConnection": "Server=(localdb)\\mssqllocaldb;Database=test2Db-Test;Trusted_Connection=True;MultipleActiveResultSets=true;"
  }
}
```

but want to **override** that DefaultConnection using user secrets:

- initialize user secrets in the project

```sh
dotnet user-secrets init
```

- add your override connection string ( note: here a local unsafe not encrypted conn testing db used )

```sh
dotnet user-secrets set "ConnectionStrings:DefaultConnection" "Server=localhost;Database=test1Db-Test;MultipleActiveResultSets=true;Encrypt=false;User ID=sa;Password=somepass"
```

- add user secrets service

```csharp
var integrationConfig = new ConfigurationBuilder()
    .AddJsonFile("appsettings.json")
    .AddUserSecrets(System.Reflection.Assembly.GetExecutingAssembly()) // ADDED
    .AddEnvironmentVariables()
    .Build();
```

This way `builder.Configuration.GetConnectionString("DefaultConnection")` retrieve value from user secrets.

## editor

- see [vscode user secrets extension](https://marketplace.visualstudio.com/items?itemName=adrianwilczynski.user-secrets)

