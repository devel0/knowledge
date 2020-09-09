# octave symbolic

## install

```sh
apt install octave python3-sympy
```

then from octave command prompt

```
pkg install -forge symbolic
```

## example 1

- edit a file `sample.m` with follow content

```matlab
pkg load symbolic

syms a b c x
eqn0 = sqrt(a*x^2 + b*x + c)
solve(eqn0, x)
```

- run from shell `octave sample.m` and results:

```
Symbolic pkg v2.9.0: Python communication link active, SymPy v1.5.1.
eqn0 = (sym)

     ________________
    ╱    2           
  ╲╱  a⋅x  + b⋅x + c 

ans = (sym 2×1 matrix)

  ⎡         _____________  ⎤
  ⎢        ╱           2   ⎥
  ⎢ -b + ╲╱  -4⋅a⋅c + b    ⎥
  ⎢ ─────────────────────  ⎥
  ⎢          2⋅a           ⎥
  ⎢                        ⎥
  ⎢ ⎛       _____________⎞ ⎥
  ⎢ ⎜      ╱           2 ⎟ ⎥
  ⎢-⎝b + ╲╱  -4⋅a⋅c + b  ⎠ ⎥
  ⎢────────────────────────⎥
  ⎣          2⋅a           ⎦
```

## example 2

```matlab
pkg load symbolic

syms x t v v0 a
eq1 = v == v0 + a * t
eq2 = x == int (rhs(eq1), t)
eq3 = t == solve (eq1, t)
eq4 = v == solve (subs (eq2, t, rhs(eq3)), v)
```

output:

```
eq1 = (sym) v = a⋅t + v₀
eq2 = (sym)

         2       
      a⋅t        
  x = ──── + t⋅v₀
       2         

eq3 = (sym)

      v - v₀
  t = ──────
        a   

eq4 = (sym 2×1 matrix)

  ⎡        _____________⎤
  ⎢       ╱           2 ⎥
  ⎢v = -╲╱  2⋅a⋅x + v₀  ⎥
  ⎢                     ⎥
  ⎢       _____________ ⎥
  ⎢      ╱           2  ⎥
  ⎣v = ╲╱  2⋅a⋅x + v₀   ⎦
```

## references

- [octave symbolic](https://octave.sourceforge.io/symbolic/overview.html)
- [octsym repository](https://github.com/cbm755/octsympy)
