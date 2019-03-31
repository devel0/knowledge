# netcore csproj

## generate documentation

```xml
<Project Sdk="Microsoft.NET.Sdk">
  <PropertyGroup>    
    <GenerateDocumentationFile>true</GenerateDocumentationFile>
  </PropertyGroup>
</Project>
```

to disable warn about missing doc

```xml
<Project Sdk="Microsoft.NET.Sdk">
  <PropertyGroup>    
    <GenerateDocumentationFile>true</GenerateDocumentationFile>
    <noWarn>1591</noWarn>
  </PropertyGroup>
</Project>
```

## csharp macro define csproj

to define a constant to use in the code like this

```csharp
#if MYCONST
//
#else
//
#endif
```

edit `.csproj` like follow ( separate by semicolon )


```xml
<Project Sdk="Microsoft.NET.Sdk">
  <PropertyGroup>
    <DefineConstants>MYCONST;MYCONST2</DefineConstants>  
  </PropertyGroup>
</Project>
```
