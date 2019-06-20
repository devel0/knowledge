# regex

## replace

```csharp
var fullstr = "23: sample [Overtest 1]";

var rgx = new Regex(@"\d+:\s");
var str = rgx.Replace(fullstr, "");

rgx = new Regex(@"\s\[Over.*\]");
str = rgx.Replace(str, "");
```

- will result in `"sample"`

## group matches

```csharp
var filename = "some_12.txt";

var match = new Regex(@".*_(\d+)\.txt").Match(filename);
if (match.Success) Console.WriteLine($"number is : {match.Groups[1].Value}");
```

## references

- [regex](https://docs.microsoft.com/en-us/dotnet/standard/base-types/regular-expression-language-quick-reference)
