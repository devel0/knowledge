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

## auto-escaping

```csharp
var base = "(some).2";
var strangefilename = base + "_myfile.txt";

var match = new Regex(Regex.Escape(base) + @"_myfile\.txt");
```

## optional group

```csharp
var str1 = "some";
var str2 = "some_123";

var match = new Regex(@"some(?<my>(_\d*)?)");
// it will matches either str1 and str2
```

## references

- [regex](https://docs.microsoft.com/en-us/dotnet/standard/base-types/regular-expression-language-quick-reference)
