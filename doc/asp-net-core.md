# asp net core

*[csharp](../README.md#csharp)*

- [general](#general)
  * [csproj](#csproj)
  * [devel0 nuget.config](#devel0-nugetconfig)
- [startup, program, helpers, global, dbcontext](#startup-program-helpers-global-dbcontext)
  * [Startup.cs](#startupcs)
  * [Program.cs](#programcs)
  * [LinuxHelper.cs](#linuxhelpercs)
  * [IGlobal.cs](#iglobalcs)
  * [Global.cs](#globalcs)
  * [MyDbContext.cs](#mydbcontextcs)
- [types](#types)
  * [Config.cs](#configcs)
  * [User.cs](#usercs)
- [controllers](#controllers)
  * [Controller.cs](#controllercs)
- [environment](#environment)

<hr/>

## general

### csproj

```xml
<Project Sdk="Microsoft.NET.Sdk.Web">

  <PropertyGroup>
    <TargetFramework>netcoreapp2.1</TargetFramework>
  </PropertyGroup>

  <ItemGroup>
    <Folder Include="wwwroot\" />
  </ItemGroup>

  <ItemGroup>
    <PackageReference Include="Microsoft.AspNetCore.App" />
    <PackageReference Include="Microsoft.AspNetCore.Razor.Design" Version="2.1.2" PrivateAssets="All" />
    <PackageReference Include="Microsoft.EntityFrameworkCore.Relational" Version="2.1.4" />
    <PackageReference Include="Microsoft.Windows.Compatibility" Version="2.0.1" />
    <PackageReference Include="Mono.Posix.NETStandard" Version="1.0.0" />
    <PackageReference Include="netcore-ef-util" Version="1.0.0-CI00023" />
    <PackageReference Include="netcore-proj" Version="1.0.0-CI00004" />
    <PackageReference Include="netcore-psql-util" Version="1.0.0-CI00010" />
    <PackageReference Include="netcore-sci" Version="1.0.0-CI00017" />
    <PackageReference Include="netcore-util" Version="1.0.0-CI00051" />
    <PackageReference Include="Npgsql.EntityFrameworkCore.PostgreSQL" Version="2.1.2" />
    <PackageReference Include="System.DirectoryServices" Version="4.5.0" />
    <PackageReference Include="System.Net.Http" Version="4.3.4" />
    <PackageReference Include="System.Runtime.Serialization.Json" Version="4.3.0" />
  </ItemGroup>

</Project>
```

### devel0 nuget.config

```xml
<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <packageSources>
    <add key="devel0" value="https://www.myget.org/F/devel0/api/v3/index.json" />    
  </packageSources>
</configuration>
```

## startup, program, helpers, global, dbcontext

### Startup.cs

```csharp
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;

namespace my
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }
        
        public void ConfigureServices(IServiceCollection services)
        {
            var serviceProvider = services.BuildServiceProvider();
            var env = serviceProvider.GetService<IHostingEnvironment>();

            services.AddSingleton<IGlobal, Global>();

            services.AddDbContext<MyDbContext>((o) =>
            {
                var global = (IGlobal)services.BuildServiceProvider().GetRequiredService(typeof(IGlobal));
                o.UseNpgsql(global.ConnectionString);
            });
            services.AddMvc().SetCompatibilityVersion(CompatibilityVersion.Version_2_1);            

            services.AddCors(options =>
            {
                if (env.IsDevelopment())
                    options.AddPolicy("MyCors", builder => builder
                    .AllowAnyOrigin()
                    .AllowAnyMethod()
                    .AllowAnyHeader()
                    .AllowCredentials());
                else
                    options.AddPolicy("MyCors", builder => builder.Build());
            });
        }
        
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            app.UseCors("MyCors");
            if (env.IsDevelopment())
            {
                System.Console.WriteLine("*** DEVELOPMENT MODE ***");
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseHsts();
            }

            app.UseHttpsRedirection();
            app.UseMvc();
        }
    }
}
```

### Program.cs

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

namespace my
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
//                .UseUrls("http://0.0.0.0:5000")
                .UseStartup<Startup>()
                .Build();
    }
}
```

### LinuxHelper.cs

```csharp
namespace my
{

    public static class LinuxHelper
    {

        /// <summary>
        /// check if given file has required mode ( default = 700 )
        /// </summary>
        public static bool IsFilePermissionSafe(string pathfilename, int mode = 448)
        {
            var mask_777 = 511;

            Mono.Unix.Native.Stat buf;
            Mono.Unix.Native.Syscall.stat(pathfilename, out buf);

            return ((int)buf.st_mode & mask_777) == mode;
        }

        /// <summary>
        /// set file permission of given pathfilename
        /// </summary>        
        public static int SetFilePermission(string pathfilename, int mode)
        {
            return Mono.Unix.Native.Syscall.chmod(pathfilename, (Mono.Unix.Native.FilePermissions)mode);
        }

    }

}
```

### IGlobal.cs

```csharp
namespace my
{

    public interface IGlobal
    {

        string ConnectionString { get; }

    }

}
```

### Global.cs

```csharp
using System;
using System.IO;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using static System.Environment;

namespace my
{

    public class Global : IGlobal
    {

        public static string AppFolder
        {
            get
            {
                var pathname = Path.Combine(Path.Combine(Environment.GetFolderPath(SpecialFolder.UserProfile), ".config"), "myapp");

                if (!Directory.Exists(pathname)) Directory.CreateDirectory(pathname);

                return pathname;
            }
        }

        public static string AppConfigPathfilename
        {
            get { return Path.Combine(AppFolder, "config.json"); }
        }

        public static string AppConfigPathfilenameBackup
        {
            get { return Path.Combine(AppFolder, "config.json.bak"); }
        }

        public Config Config { get; private set; }

        public string ConnectionString => Config.ConnectionString;

        private readonly ILogger logger;

        public Global(ILogger<Global> logger)
        {
            this.logger = logger;

            if (!File.Exists(Global.AppConfigPathfilename))
            {
                Config = new Config();
                Config.Save(logger);
            }
            else
            {
                // check mode 600
                if (!LinuxHelper.IsFilePermissionSafe(AppConfigPathfilename, 384))
                {
                    throw new Exception($"invalid file permission [{AppConfigPathfilename}] must set to 600");
                }

                var attrs = File.GetAttributes(AppConfigPathfilename);
                Config = JsonConvert.DeserializeObject<Config>(File.ReadAllText(AppConfigPathfilename));
            }

            if (string.IsNullOrEmpty(Config.DBHostname) || Config.DBPassword == "pass")
            {
                Config.DBHostname = "hostname";
                Config.DBPort = 5432;
                Config.DBName = "myappdb";
                Config.DBUsername = "postgres";
                Config.DBPassword = "pass";
                Config.Save(logger);

                throw new Exception($"please configure [{AppConfigPathfilename}] setting DBHostname, DBPort, DBName, DBUsername, DBPassword (see README.md)");
            }
        }

    }

}
```

### MyDbContext.cs

```csharp
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Design;
using SearchAThing.PsqlUtil;

namespace my
{    

    public class MyDbContext : DbContext
    {

        static bool psql_initialized = false;
        static object lck_psql_initialized = new object();

        public MyDbContext(DbContextOptions options) : base(options)
        {
            if (!psql_initialized)
            {
                lock (lck_psql_initialized)
                {
                    if (!psql_initialized) this.EnableFirstLastAggregateFunctions();
                    psql_initialized = true;
                }
            }
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
            //builder.Entity<Doc>().HasIndex(x => new { x.id_user, x.description }).IsUnique();

            //
            // INDEX
            //
            // builder.Entity<UserJob>().HasIndex(x => x.trigger_timestamp);

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
            // builder.Entity<Job>().Property(p => p.min_cost).HasDefaultValue(MIN_COST_DEFAULT);
            // builder.Entity<Job>().Property(p => p.base_cost).HasDefaultValue(BASE_COST_DEFAULT);
            // builder.Entity<Job>().Property(p => p.cost_factor).HasDefaultValue(COST_FACTOR_DEFAULT);
            // builder.Entity<Job>().Property(p => p.minutes_round).HasDefaultValue(MINUTES_ROUND_DEFAULT);
        }

        public DbSet<User> Users { get; set; }

    }

}
```

## types

### Config.cs

```csharp
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;

namespace my
{

    public class Config
    {

        public string DBHostname { get; set; }
        public int DBPort { get; set; }
        public string DBName { get; set; }
        public string DBUsername { get; set; }
        public string DBPassword { get; set; }

        [JsonIgnore]
        public string ConnectionString
        {
            get
            {
                return $"Server={DBHostname};Database={DBName};Username={DBUsername};Port={DBPort};Password={DBPassword}";
            }
        }

        public void Save(ILogger logger)
        {
            try
            {
                if (File.Exists(Global.AppConfigPathfilename))
                    File.Copy(Global.AppConfigPathfilename, Global.AppConfigPathfilenameBackup, true);
            }
            catch (Exception ex)
            {
                logger.LogError($"unable to backup config file [{Global.AppConfigPathfilename}] to [{Global.AppConfigPathfilenameBackup}] : {ex.Message}");
            }
            File.WriteAllText(Global.AppConfigPathfilename, JsonConvert.SerializeObject(this, Formatting.Indented));
            // save with mode 600
            LinuxHelper.SetFilePermission(Global.AppConfigPathfilename, 384);
        }

    }

}
```

### User.cs

```csharp
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace my
{

    [Table("user")]
    public class User
    {

        [Key]
        public int id { get; set; }

        [Required]
        public string username { get; set; }        

        [Required]
        /// <summary>
        /// create timestamp ( UTC )
        /// </summary>    
        public DateTime create_timestamp { get; set; }

        /// <summary>
        /// modify timestamp ( UTC )
        /// </summary>
        public DateTime? modify_timestamp { get; set; }

        /// <summary>
        /// last login timestamp ( UTC )
        /// </summary>
        public DateTime? last_login_timestamp { get; set; }        

    }

}
```

## controllers

### Controller.cs

```csharp
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.DirectoryServices;
using System.DirectoryServices.AccountManagement;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;

namespace my.Controllers
{
    
    [Route("api/[action]")]
    [EnableCors("MyCors")]//"ReleaseCors")]
    [ApiController]
    public partial class MyController : ControllerBase
    {

        private readonly IGlobal global;
        private readonly ILogger logger;
        private readonly MyDbContext ctx;
        private readonly IHostingEnvironment env;

        public MyController(MyDbContext ctx, ILogger<MyController> logger,
        IHostingEnvironment env)
        {
            this.logger = logger;
            this.ctx = ctx;
            this.env = env;
            logger.LogDebug($"MyController created");
        }

        #region helpers
        CommonResponse InvalidAuthResponse()
        {
            return new CommonResponse() { exitCode = CommonResponseExitCodes.InvalidAuth };
        }

        CommonResponse SuccessfulResponse()
        {
            return new CommonResponse() { exitCode = CommonResponseExitCodes.Successful };
        }

        CommonResponse ErrorResponse(string errMsg)
        {
            return new CommonResponse()
            {
                exitCode = CommonResponseExitCodes.Error,
                errorMsg = errMsg
            };
        }
        #endregion


    }

}
```

## environment

- for F5 debug in `launch.json`

  - Production
```json
{ "configurations": [ { "env": { "ASPNETCORE_ENVIRONMENT": "Production" } } ] }
```
  - Development
```json
{ "configurations": [ { "env": { "ASPNETCORE_ENVIRONMENT": "Development" } } ] }
```

- from commandline

```sh
dotnet run -c Release
```
