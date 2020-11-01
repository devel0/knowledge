# python solve eq

## example

```python
from sympy import *
import numpy as np

a, b, c, x = symbols('a b c x');

print()
e1 = Eq(a*x**2 + b*x + c, 0)
pprint(e1)

print()
e2 = solve((e1),(x))
pprint(e2)
```

## result

```
   2              
a⋅x  + b⋅x + c = 0

⎡        _____________   ⎛       _____________⎞ ⎤
⎢       ╱           2    ⎜      ╱           2 ⎟ ⎥
⎢-b + ╲╱  -4⋅a⋅c + b    -⎝b + ╲╱  -4⋅a⋅c + b  ⎠ ⎥
⎢─────────────────────, ────────────────────────⎥
⎣         2⋅a                     2⋅a           ⎦
```
