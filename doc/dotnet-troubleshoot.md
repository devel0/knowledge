# dotnet troubleshoot

<!-- TOC -->
* [Unable to satisfy conflicting requests for](#unable-to-satisfy-conflicting-requests-for)
* [DateTimeOffset packing error](#datetimeoffset-packing-error)
* [restore on slow lines](#restore-on-slow-lines)
<!-- TOCEND -->

## Unable to satisfy conflicting requests for

refs: https://github.com/NuGet/Home/issues/5483

This error for conflicting request for `pkgA` compiling `lib3` could results in follow scenario:

- `lib1` sources ( PackageReference to `pkgA` package )
- `lib2` sources ( PackageReference to `lib1` package ) ⬅ solve by use ProjectReference instead of PackageReference to lib1
- `lib3` sources ( ProjectReference to `lib2` source )

## DateTimeOffset packing error

```
/usr/share/dotnet/sdk/3.1.200/Sdks/NuGet.Build.Tasks.Pack/buildCrossTargeting/NuGet.Build.Tasks.Pack.targets(198,5): error : The DateTimeOffset specified cannot be converted into a Zip file timestamp. (Parameter 'value')
```

- [linux workaround](https://github.com/NuGet/Home/issues/7001#issuecomment-588026190)

## restore on slow lines

```sh
dotnet restore -v n --disable-parallel
```