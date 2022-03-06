# stm32 tips

## different behavior on debugging versus upload

- double check if you call functions that promise to return something but lacks of a return statement

```c
bool SomeFn()
{
// missing return
}
```

## `Error erasing flash with vFlashErase packet` error

- close all vscode
- `ps ax | grep -i platform` : then kill platformio processes
- `ps ax | grep -i openocd` : then kill openocd processes
- detach/reattach usb
