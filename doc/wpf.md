# wpf

## open explorer and select a file

```cs
var pathfilename=@"c:\some\file.txt";
System.Diagnostics.Process.Start($"explorer", $"/select,\"{pathfilename}\"");
```

## design data context

```xaml
<UserControl x:Name="userControl" x:Class="Myns.Myctl"
             xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
             xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
             xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006" 
             xmlns:d="http://schemas.microsoft.com/expression/blend/2008" 
             xmlns:local="clr-namespace:Myns"
             d:DataContext="{d:DesignInstance Type=local:MyItem, IsDesignTimeCreatable=True}">
</UserControl>
```

## escaping ascii char

to insert special ascii char like newline ( 0xa : 10 ) put hex value into HH as follow:

&#x**HH**;

## newline in xaml

```xaml
<TextBlock Text="sample&#x0a;NEWLINE"/>
```

## reset datagrid column sorting

[ref](https://stackoverflow.com/a/56054895/5521766)
