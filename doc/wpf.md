# wpf

## open explorer and select a file

```cs
var pathfilename=@"c:\some\file.txt";
System.Diagnostics.Process.Start($"explorer", $"/select,\"{pathfilename}\"");
```
