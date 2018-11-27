# regex

## replace

```csharp
var fullstr = "23: sample [Overtest 1]";

var rgx = new Regex("\\d+:\\s");
var str = rgx.Replace(fullstr, "");

rgx = new Regex("\\s\\[Over.*\\]");
str = rgx.Replace(str, "");
```

- will result in `"sample"`

## references

- [regex](https://docs.microsoft.com/en-us/dotnet/standard/base-types/regular-expression-language-quick-reference)
