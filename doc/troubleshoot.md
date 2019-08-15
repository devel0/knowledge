# troubleshoot

*[development tools](../README.md#development-tools)*

## issue

installing some packages

```
Package 'NameOfPackage' is incompatible with 'all' frameworks in project
```

solve by clean nuget cache

```
dotnet nuget locals all -c
```
