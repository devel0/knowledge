# csharp angouri math

```sh
dotnet add package AngouriMath --version 1.4.0
```

```csharp
var expr = "x > 10 and x < 20";            
Debug.Assert(expr.Substitute("x", 10).EvalBoolean() == false);
Debug.Assert(expr.Substitute("x", 15).EvalBoolean() == true);
Debug.Assert(expr.Substitute("x", 20).EvalBoolean() == false);

expr = "abs(x) < 5";
Debug.Assert(expr.Substitute("x", -5).EvalBoolean() == false);
Debug.Assert(expr.Substitute("x", -1).EvalBoolean() == true);
Debug.Assert(expr.Substitute("x", 0).EvalBoolean() == true);
Debug.Assert(expr.Substitute("x", 1).EvalBoolean() == true);
Debug.Assert(expr.Substitute("x", 5).EvalBoolean() == false);
```