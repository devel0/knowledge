# psql ef codefirst

*csharp*

## prerequisites

- install `Npgsql.EntityFrameworkCore.PostgreSQL` nuget package

```
dotnet add package Npgsql.EntityFrameworkCore.PostgreSQL --version 2.0.2
```

- add dotnet ef tools in your csproj under an ItemGroup

```
<DotNetCliToolReference Include="Microsoft.EntityFrameworkCore.Tools.DotNet" Version="2.0.2" />    
```

## setup ConfigureServices

```csharp
using Microsoft.EntityFrameworkCore;
```

```csharp
connectionString =
  $"Server={DBHOST};Database={DBNAME};" +
  $"Username=postgres;Password={dbpass}";
  services.AddEntityFrameworkSqlite().AddDbContext<DBContext>(options => options.UseNpgsql(connectionString));
```

## setup Program

- role of **MainStarted** is to avoid validation process during db migration

```csharp
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;

namespace FirewallManagerWebapi
{
    public class Program
    {

        public static bool MainStarted { get; private set; }

        public static void Main(string[] args)
        {
            MainStarted = true;

            BuildWebHost(args).Run();
        }

        public static IWebHost BuildWebHost(string[] args) =>
            WebHost.CreateDefaultBuilder(args)
                .UseStartup<Startup>()
                .Build();
    }
}
```

## setup DBContext

```csharp
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;

namespace Test
{

    public class DBContext : DbContext
    {

        public DBContext(DbContextOptions<DBContext> options) : base(options)
        {
        }

        void CheckValidate(IEnumerable<object> entities)
        {
            foreach (var entity in entities)
            {
                var validCtx = new ValidationContext(entity);
                Validator.ValidateObject(entity, validCtx);
            }

        }

        void MySaveChanges()
        {
            if (Program.MainStarted) // avoid to process these if in migrations
            {
                var entities = from e in ChangeTracker.Entries()
                               where e.State == EntityState.Added || e.State == EntityState.Modified
                               select e.Entity;

                CheckValidate(entities);                
            }
        }

        public override Task<int> SaveChangesAsync(CancellationToken cancellationToken = default(CancellationToken))
        {
            MySaveChanges();

            return base.SaveChangesAsync(cancellationToken);
        }

        public override int SaveChanges()
        {
            MySaveChanges();

            return base.SaveChanges();
        }

        protected override void OnModelCreating(ModelBuilder builder)
        {
            base.OnModelCreating(builder);            

            //
            // UNIQUE INDEX
            //
            builder.Entity<Doc>().HasIndex(x => new { x.id_user, x.description }).IsUnique();

            //
            // INDEX
            //
            builder.Entity<Doc>().HasIndex(x => x.uuid);

            //
            // DELETE BEHAVIOR
            //
            foreach (var relationship in builder.Model.GetEntityTypes().SelectMany(e => e.GetForeignKeys()))
            {
                relationship.DeleteBehavior = DeleteBehavior.Restrict;
            }

            //
            // DEFAULT VALUES
            //
            builder.Entity<Doc>().Property(p => p.item2).HasDefaultValue(22);            
        }
        
        public DbSet<Doc> Docs { get; set; }
    }

}
```

## example of Data Type

```csharp
using Newtonsoft.Json;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Test
{     

    [Table("contact")]
    public class Contact
    {

        [Key]
        public long id { get; set; }

        [ForeignKey("id_user")]
        [JsonIgnore] // secure load
        public User user { get; set; }
        [Required]
        public long id_user { get; set; }

        [Required]
        public string name { get; set; }     

    }

}
```

## create initial db

```
dotnet ef migrations add migr1
dotnet ef database update
```
