# stm32 tips

## different behavior on debugging versus upload

- double check if you call functions that promise to return something but lacks of a return statement

```c
bool SomeFn()
{
// missing return
}
```
