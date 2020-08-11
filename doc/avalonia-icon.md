# avalonia icon

## csproj

```xml
<ItemGroup>
  <AvaloniaResource Include="Assets\**"/>
</ItemGroup>
```

## assets

- create an `Assets` folder and copy `image.png` (any size) into it
- ensure transparency layer in the `image.png` ( open with gimp Layers/Transparency Add 'Alpha Channel' then 'Colour to Alpha' to remove background )
- generate `favicon.ico` with follow command

```sh
convert Assets/image.png -define icon:auto-resize=16,32,48,64,256 Assets/favicon.ico
```

## mainwindow

```xml
<Window
  Icon="/Assets/favicon.ico">
```
