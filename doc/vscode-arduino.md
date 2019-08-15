# vscode-arduino

*[electronics](../README.md#electronics)*

## setup

> note: change paths accordingly your local installation

- install vscode
- open a sketch (.ino file ) and install proposed extension
- `ctrl+, Arduino path` set to `/home/devel0/softcollect.public/arduino/arduino-1.8.7`
- reload vscode
- `ctrl+shift+p c/cpp edit configurations` set
```
"browse": {
    "path": [        
        "/home/devel0/Arduino/libraries",        
        "/home/devel0/softcollect.public/arduino/arduino-1.8.7/hardware/tools/avr/avr/include/avr",
        "/home/devel0/softcollect.public/arduino/arduino-1.8.7/hardware/arduino/avr/cores/arduino"
    ]
},
```
- `ctrl+shift+p change board type` ( this will fill hardware atmega path in cpp includePath )
- in the bottom toolbar choose programmer ( eg. AVRISP mkII )
- analyze missing includes from the PROBLEMS window and resolve through light bulb on your `#include <....>` that will add some includePath from guess browse paths given in `c_cpp_properties.json`

## troubleshoot

- avrdude run with stk500v2 instead of chosen programmer : `ctrl+p upload using programmer`
- cannot open "WProgram.h" ( just add `#define ARDUINO 10807` to top of your code )
- cannot open serial ( may you have read-write permission as `dialout` group but still receive error you can set 666 only for usb serial arduino adapter ) :
  - `/etc/udev/rules.d/99-arduino-usb.rules`

```
SUBSYSTEMS=="usb", ATTRS{idVendor}=="1a86", ATTRS{idProduct}=="7523", MODE="0666"
```

  - check your idVendor:idProduct through `lsusb`

## usage

- verify sketch ( `ctrl+alt+r` )
- upload sketch ( `ctrl+shift+p arduino upload using programmer` )
- open serial monitor ( ctrl+shift+p `open serial monitor` ) will visible in output / serial monitor

## increase build speed

- set build option in `.vscode/arduino.json`

```
{
    "output": "../build"
}
```

- when synchronize between nodes exclude `build` and `.vscode` folders to avoid build options changed detect
