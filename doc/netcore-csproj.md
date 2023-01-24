# netcore csproj

<!-- TOC -->
* [generate documentation](#generate-documentation)
* [copy to output folder](#copy-to-output-folder)
* [csharp macro define csproj](#csharp-macro-define-csproj)
* [platform macro](#platform-macro)
* [exclude files from compile](#exclude-files-from-compile)
* [disable warnings](#disable-warnings)
* [force bin,obj clean](#force-binobj-clean)
* [execute cmd before build](#execute-cmd-before-build)
* [link source from other project](#link-source-from-other-project)
* [prebuild copy files](#prebuild-copy-files)
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

- to be recursive ( sparse files in output )

```xml
<ItemGroup Condition="'$(Configuration)' == 'Debug'">
  <None Include="doc/**/*" CopyToOutputDirectory="PreserveNewest" />
</ItemGroup>
```

- to be recursive ( single folder in output )

```xml
<ItemGroup Condition="'$(Configuration)' == 'Debug'">
  <None Include="doc/**/*" CopyToOutputDirectory="PreserveNewest" Link="doc/%(RecursiveDir)/%(Filename)%(Extension)" />
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

## platform macro

```xml
<Project Sdk="Microsoft.NET.Sdk">
  <PropertyGroup Condition="$([MSBuild]::IsOSPlatform('Windows'))">
    <DefineConstants>WINDOWS_PLATFORM</DefineConstants>  
  </PropertyGroup>  

  <PropertyGroup Condition="$([MSBuild]::IsOSPlatform('OSX'))">
    <DefineConstants>OSX_PLATFORM</DefineConstants>  
  </PropertyGroup>  

  <PropertyGroup Condition="$([MSBuild]::IsOSPlatform('Linux'))">
    <DefineConstants>LINUX_PLATFORM</DefineConstants>  
  </PropertyGroup>
</Project>
```

the use in code like follow

```cs
#if WINDOWS_PLATFORM
//
#else
//
#endif
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

## force bin,obj clean

:warning: this will remove all `bin` and `obj` folders recursively starting from current working dir

```sh
 find -type d -name "bin" -exec rm -fr '{}' \; ; find -type d -name "obj" -exec rm -fr '{}' \;
```

## execute cmd before build

```xml
<Target Name="MyPreBuildTarget" BeforeTargets="Build">
  <Exec Command="echo sample"/>
</Target>
```

## link source from other project

```xml
<ItemGroup>
  <Compile Include="../iot-gateway-api/IOTGateway.cs"/>
</ItemGroup>
```

## prebuild copy files

follow task will copy a file placed ( relative to csproj ) `../../src/gui/Assets/Dictionary1.xaml` into the csproj folder base relative `Assets/gui-dictionary.xaml` before each build

```xml
<Target Name="CopyGUIAssets" BeforeTargets="Build">
  <Copy SourceFiles="../../src/gui/Assets/Dictionary1.xaml" DestinationFolder="Assets/gui-dictionary.xaml" />
</Target>
```