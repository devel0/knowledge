# netcore platform environment

## detect os type

```cs
var isFreeBSD = RuntimeInformation.IsOSPlatform(OSPlatform.FreeBSD);
var isLinux = RuntimeInformation.IsOSPlatform(OSPlatform.Linux);
var isOSX = RuntimeInformation.IsOSPlatform(OSPlatform.OSX);
var isWindows = RuntimeInformation.IsOSPlatform(OSPlatform.Windows);
```

## DEBUG macro

```cs
#if DEBUG
  Console.WriteLine("debug mode");
#endif
```

the code will included in Debug but not in Release mode

**debug** execution

```sh
dotnet run
```

or build and run faster 2th times directly

```sh
dotnet build
dotnet bin/Debug/netcoreapp3.0/myapp.dll
```

**release** execution

```sh
dotnet run -c Release
```

or build and run faster 2th times directly

```sh
dotnet build -c Release
dotnet bin/Debug/netcoreapp3.0/myapp.dll
```

