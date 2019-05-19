# netcore platform environment

## detect os type

```cs
var isFreeBSD = RuntimeInformation.IsOSPlatform(OSPlatform.FreeBSD);
var isLinux = RuntimeInformation.IsOSPlatform(OSPlatform.Linux);
var isOSX = RuntimeInformation.IsOSPlatform(OSPlatform.OSX);
var isWindows = RuntimeInformation.IsOSPlatform(OSPlatform.Windows);
```
