# csharp to typescript

- add package reference to the project

```sh
dotnet add package Reinforced.Typings
```

- create an helper `rtcli.sh` as follow ( change version as needed ) then `chmod +x rtcli.sh`

```sh
#!/bin/bash
dotnet ~/.nuget/packages/reinforced.typings/1.5.2/tools/netcoreapp2.1/rtcli.dll $@
```

- apply `[TsInterface]` attributes to csharp classes to export and run

- build copying related dlls within `dotnet build /p:CopyLocalLockFileAssemblies=true`

- run the tool

```sh
./rtcli.sh \
	SourceAssemblies="fullpath-project/bin/Debug/netcoreapp2.1/mylib.dll" \
	TargetDirectory="fullpath-target-directory" \
	Hierarchy="true"
```
