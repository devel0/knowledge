# netcore csproj

<!-- TOC -->
- [netcore csproj](#netcore-csproj)
  * [generate documentation](#generate-documentation)
  * [copy to output folder](#copy-to-output-folder)
  * [csharp macro define csproj](#csharp-macro-define-csproj)
  * [exclude files from compile](#exclude-files-from-compile)
  * [disable warnings](#disable-warnings)
<!-- TOCEND -->

<hr/>

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

## copy to output folder

```xml
<ItemGroup Condition="'$(Configuration)' == 'Debug'">
  <None Include="doc/file.dxf" CopyToOutputDirectory="PreserveNewest" />
</ItemGroup>
```

- to be recursive

```xml
<ItemGroup Condition="'$(Configuration)' == 'Debug'">
  <None Include="doc/**/*" CopyToOutputDirectory="PreserveNewest" />
</ItemGroup>
```

- to include in aspnet core publish

```xml
<ItemGroup>
    <Content Include="somefld/subfld/**">
        <CopyToOutputDirectory>PreserveNewest</CopyToOutputDirectory>
    </Content>
</ItemGroup>
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

or **conditionally** based on configuration used `dotnet build -c Release`

```xml
<Project Sdk="Microsoft.NET.Sdk">
  <PropertyGroup Condition="'$(Configuration)' == 'Release'">
    <DefineConstants>MYCONST;MYCONST2</DefineConstants>  
  </PropertyGroup>  
</Project>
```

## exclude files from compile

```xml
<Project Sdk="Microsoft.NET.Sdk">

  <PropertyGroup>
    <TargetFramework>netstandard2.0</TargetFramework>
    <RootNamespace>server_lib</RootNamespace>
    <GenerateDocumentationFile>true</GenerateDocumentationFile>    
  </PropertyGroup>

  <ItemGroup>
    <Compile Remove="Program.cs"/>
  </ItemGroup>

</Project>
```

## disable warnings

follow to disable missing XML comment

```xml
<Project Sdk="Microsoft.NET.Sdk.Web">
    <PropertyGroup>
        <noWarn>1591</noWarn>
    </PropertyGroup>
</Project>
```
