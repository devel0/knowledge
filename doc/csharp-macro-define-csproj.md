# csharp macro define csproj

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
