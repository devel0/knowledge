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

## stm32f446re : Serial3 and Serial4 conflicts

configuring Serial3 with PC11(rx) and PC10(tx) and Serial4 with PA1(rx) and PA0(tx) youll'get a strange behavior: writing to Serial3 results in receive to Serial4. Effectively this relates to **ALTERNATE FUNCTIONS** of pins.

to use all serials in f446re, supply `platformio.ini` with follow config ( Serial2 is attached the usb ) :

```ini
	-DENABLE_HWSERIAL1 -DPIN_SERIAL1_RX=PB7 -DPIN_SERIAL1_TX=PA9
	-DENABLE_HWSERIAL3 -DPIN_SERIAL3_RX=PC11_ALT1 -DPIN_SERIAL3_TX=PC10_ALT1	
	-DENABLE_HWSERIAL4 -DPIN_SERIAL4_RX=PA1 -DPIN_SERIAL4_TX=PA0
	-DENABLE_HWSERIAL5 -DPIN_SERIAL5_RX=PD2 -DPIN_SERIAL5_TX=PC12	
	-DENABLE_HWSERIAL6 -DPIN_SERIAL6_RX=PC7 -DPIN_SERIAL6_TX=PC6
```