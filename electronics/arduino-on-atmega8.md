# arduino on atmega8

*electronics*

## purpose

Reuse of standalone atmega8 chips for small projects ( flash is 8kb vs 32kb of atmega328 standard for arduino ).
In order to program these chip using arduino and its libraries there is no need to flash a bootloader if you use an external usbasp programmer connected to miso,mosi,sck,reset of target atmega.

## requirements

- usbasp programmer
- atmega8 chip
- breadbord
- dupont cables

to test
- 1 led
- 1k resistor

## howto

### install boards into arduino

thanks to [this project](https://github.com/carlosefr/atmega) its easy to enable arduino to talk to atmega8 processor even at 8Mhz internal rc oscillator speed, to install just go to `File/Preferences` and in `Additional Boards Manager URLS` insert the json file `https://raw.githubusercontent.com/carlosefr/atmega/master/package_carlosefr_atmega_index.json`.
now you'll see in tools boards ATmega Microcontrollers that include also 8/168/328 models

### setup fuses

```
avrdude -c usbasp -p m8 -B 10.0 -U lfuse:w:0xe4:m -U hfuse:w:0xca:m -U efuse:w:0xff:m
```

### upload a sketch

- Tools
  - Board/ATmega8
  - Processor/ATmega8
  - Programmer/USBasp

- File/Examples/Basics/Led
- Sketch/Upload

![img](/_files/atmega8-arduino-bootloaded.jpg)
