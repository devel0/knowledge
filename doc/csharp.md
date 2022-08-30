# csharp

## The expression being assigned to 'SomeConstVarName' must be constant csharp(CS0133)

```csharp
The expression being assigned to 'Vector3D.Zero' must be constant [netcore-sci]csharp(CS0133)

public const SomeType SomeConstVarName = new SomeType(10);
```

can solve the problem by declaring the assigned value as a `public static readonly` field like the following

```csharp
public static readonly SomeType SomeConstVarName = new SomeType(10);
```

## convert int to hex

```csharp
int a = 10;
var hexStr1Digit = a.ToString("X"); // "A"
var hexStr2Digit = a.ToString("X2"); // "0A"
```
