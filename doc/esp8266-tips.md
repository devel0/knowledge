# esp8266 tips

## ISR not in IRAM!

to solve prepend `ICACHE_RAM_ATTR` to the isr function:

```cpp
void ICACHE_RAM_ATTR ISR_my()
{
  //
}
```
