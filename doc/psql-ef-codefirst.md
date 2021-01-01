# psql ef codefirst webapi

## steps

- create a sample project

```
dotnet new webapi --name=test
dotnet add package Npgsql.EntityFrameworkCore.PostgreSQL --version 2.1.2
dotnet add package Microsoft.EntityFrameworkCore.Relational --version 2.1.3
```

- [create mydbcontext](https://github.com/devel0/worked-hours-tracker/blob/1b709297dc2b490771bde12f778504184563887a/WorkedHoursTrackerWebapi/MyDbContext.cs)

- [configure services](https://github.com/devel0/worked-hours-tracker/blob/1b709297dc2b490771bde12f778504184563887a/WorkedHoursTrackerWebapi/Startup.cs#L37-L42)

- setup external json config credentials
  - [config type](https://github.com/devel0/worked-hours-tracker/blob/1b709297dc2b490771bde12f778504184563887a/WorkedHoursTrackerWebapi/Types/Config.cs)
  - [global injection user initializer](https://github.com/devel0/worked-hours-tracker/blob/1b709297dc2b490771bde12f778504184563887a/WorkedHoursTrackerWebapi/Global.cs#L63-L73)
  - [register global singleton service for injection](https://github.com/devel0/worked-hours-tracker/blob/1b709297dc2b490771bde12f778504184563887a/WorkedHoursTrackerWebapi/Startup.cs#L35)
  
- [inject ctx](https://github.com/devel0/worked-hours-tracker/blob/1b709297dc2b490771bde12f778504184563887a/WorkedHoursTrackerWebapi/Controllers/ApiController.cs#L26)

## create initial db

```
dotnet ef migrations add migr1
dotnet ef database update
```

## dotnet-ef upgrade net framework

if use some preview version

```sh
dotnet tool update --global dotnet-ef --version 3.0.0-preview5.19227.1
```
