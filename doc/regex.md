# regex

<!-- TOC -->
- [regex](#regex)
  * [reference](#reference)
  * [negative match](#negative-match)
  * [replace](#replace)
  * [replace all characters that not match allowed](#replace-all-characters-that-not-match-allowed)
  * [group matches](#group-matches)
  * [optional character](#optional-character)
  * [auto-escaping](#auto-escaping)
  * [optional group](#optional-group)
<!-- TOCEND -->

<hr/>

## reference

- [Character classes in regular expressions](https://docs.microsoft.com/en-us/dotnet/standard/base-types/character-classes-in-regular-expressions)
- [regex](https://docs.microsoft.com/en-us/dotnet/standard/base-types/regular-expression-language-quick-reference)

## negative match

```csharp
var str = "tcpmux          1/tcp                           # TCP port service multiplexer";
var regex = new Regex(@"([^\s]*)\s*([^/]*)/([^\s]*)");
var match = regex.Match(str.Replace('\t', ' '));
var name = match.Groups[1].Value; // "tcpmux"
var port = int.Parse(match.Groups[2].Value); // "1"
var protocol = match.Groups[3].Value; // "tcp"
```

## replace

```csharp
var fullstr = "23: sample [Overtest 1]";

var rgx = new Regex(@"\d+:\s");
var str = rgx.Replace(fullstr, "");

rgx = new Regex(@"\s\[Over.*\]");
str = rgx.Replace(str, "");
```

- will result in `"sample"`

## replace all characters that not match allowed

```csharp
var rgx = new Regex(@"[^a-zA-Z0-9\-]");
var str = "Wrong_Host name";
```

- will results in "Wrong-Host-name"

## group matches

```csharp
var filename = "some_12.txt";

var match = new Regex(@".*_(\d+)\.txt").Match(filename);
if (match.Success) Console.WriteLine($"number is : {match.Groups[1].Value}");
```

## optional character

```csharp
var regex = new Regex(@"X\s*=\s*([-]?[\d\.]*)\s*Y\s*=\s*([-]?[\d\.]*)\s*Z\s*=\s*([-]?[\d\.]*)");

var match = regex.Match("X = -187.42845697 Y = 128.44203407 Z = 25.92565607");
if (match.Success)
{
  var x = match.Groups[1].Value;
  var y = match.Groups[2].Value;
  var z = match.Groups[3].Value;
  Console.WriteLine($"coord x:{x} y:{y} z:{z}");
}
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
