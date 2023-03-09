# csharp

<!-- TOC -->
* [Struct reference](#struct-reference)
  + [readonly ref argument](#readonly-ref-argument)
* [readonly ref field](#readonly-ref-field)
* [Number conversion](#number-conversion)
  + [convert int to hex](#convert-int-to-hex)
* [Templates](#templates)
  + [implicit type inference](#implicit-type-inference)
* [Troubleshoot](#troubleshoot)
  + [The expression being assigned to 'SomeConstVarName' must be constant csharp(CS0133)](#the-expression-being-assigned-to-someconstvarname-must-be-constant-csharpcs0133)
* [macro](#macro)
  + [disable warning](#disable-warning)
<!-- TOCEND -->

## Struct reference

### readonly ref argument

```csharp
Vector3 v = Vector3.One;

float Sample(Vector3 v)
{
    return v.X;
}
System.Console.WriteLine(Sample(v));

float ReadonlySample(in Vector3 v) // ensure that struct argument is readonly, passed by ref
{
    // v.X = 2; // <-- this generate follow compiler error
    // error CS8332: Cannot assign to a member of variable 'v'
    // or use it as the right hand side of a ref assignment
    // because it is a readonly variable

    return v.X;
}
System.Console.WriteLine(ReadonlySample(v));
```

compiles to:

```il
// Vector3 v2 = Vector3.One;
IL_0001: call valuetype [System.Numerics.Vectors]System.Numerics.Vector3 [System.Numerics.Vectors]System.Numerics.Vector3::get_One()
IL_0006: stloc.0
// Console.WriteLine(Sample(v2));
IL_0007: nop
IL_0008: ldloc.0
IL_0009: call float32 test_console.Sample::'<Main>g__Sample|0_0'(valuetype [System.Numerics.Vectors]System.Numerics.Vector3)
IL_000e: call void [System.Console]System.Console::WriteLine(float32)
// (no C# code)
IL_0013: nop
// Console.WriteLine(ReadonlySample(in v2));
IL_0014: nop
IL_0015: ldloca.s 0
IL_0017: call float32 test_console.Sample::'<Main>g__ReadonlySample|0_1'(valuetype [System.Numerics.Vectors]System.Numerics.Vector3&)
IL_001c: call void [System.Console]System.Console::WriteLine(float32)
```

## readonly ref field

```csharp
using System.Numerics;

public ref struct ReadonlyTest
{

    public ref readonly Vector3 v;

    public ReadonlyTest(ref Vector3 _v)
    {
        v = ref _v;
    }
}

public class Sample
{

    static void Main(string[] args)
    {
        var v = new Vector3(1, 2, 3);

        var test = new ReadonlyTest(ref v);

        v.X = 10;

        var x = v.X;

        var x2 = test.v.X;

        System.Console.WriteLine($"{x} {x2}"); // expects 10 10
    }

}
```

compiles to:

```il
// float x = _v.X;
IL_002b: ldloc.0
IL_002c: ldfld float32 [System.Numerics.Vectors]System.Numerics.Vector3::X
IL_0031: stloc.2
// float x2 = readonlyTest.v.X;
IL_0032: ldloca.s 1
IL_0034: ldfld valuetype [System.Numerics.Vectors]System.Numerics.Vector3& ReadonlyTest::v
IL_0039: ldfld float32 [System.Numerics.Vectors]System.Numerics.Vector3::X
IL_003e: stloc.3
```

## Number conversion

### convert int to hex

```csharp
int a = 10;
var hexStr1Digit = a.ToString("X"); // "A"
var hexStr2Digit = a.ToString("X2"); // "0A"
```

## Templates

### implicit type inference

- [ref](https://riptutorial.com/csharp/example/253/implicit-type-inference--methods-)

## Troubleshoot

### The expression being assigned to 'SomeConstVarName' must be constant csharp(CS0133)

```csharp
The expression being assigned to 'Vector3D.Zero' must be constant [netcore-sci]csharp(CS0133)

public const SomeType SomeConstVarName = new SomeType(10);
```

can solve the problem by declaring the assigned value as a `public static readonly` field like the following

```csharp
public static readonly SomeType SomeConstVarName = new SomeType(10);
```

## macro

### disable warning

to disable specific warning CSXXXX
```csharp
#pragma warning disable CSXXXX
...
#pragma warning restore CSXXXX
```
