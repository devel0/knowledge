# csharp member not null

```cs
string? str1;
string? str2;

[MemberNotNull(nameof(str1), nameof(str2))] // tell this method ensure str1, str2 not null
void PreconditionChecks()
{
    if (str1 is null || str2 is null)
        throw new Exception($"some preconditions failed");
}

void DoStuff()
{
    PreconditionChecks();

    var l1 = str1.Length; // no warn on str1 can be null
    var l2 = str2.Length; // no warn on str2 can be null    
}
```
