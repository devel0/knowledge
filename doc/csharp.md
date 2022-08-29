# csharp

## `Default parameter value for 'var' must be a compile-time constant`

```csharp
public MyClass(SomeType var = new SomeType(10))
```

can solve the problem by declaring the assigned value as a `public static readonly` field like the following

```csharp
public SomeType
{
  // ...
  public static readonly SomeType Value10 = new SomeType(10);
}
```

and change usage

```csharp
public MyClass(SomeType var = SomeType.Value10)
```
