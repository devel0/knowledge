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
avrdude -c usbasp -p m8 -B 10.0 -U lfuse:w:0xa4:m -U hfuse:w:0xcd:m
```

- references
  - [avr fuse calculator](http://eleccelerator.com/fusecalc/fusecalc.php?chip=atmega8&LOW=A4&HIGH=CD)
  - for other models and/or different clock sources see [boards.txt](https://github.com/carlosefr/atmega/blob/master/avr/boards.txt)
  
Follows table of 8Mhz internal for various models

| **model** | **low fuse** | **high fuse** | **extended fuse** |
|---|---|---|---|
| m8 | 0xa4 | 0xcd | |
| m168/168p | 0xe2 | 0xdd | 0xf9 |
| m328/328p | 0xe2 | 0xdb | 0xfd |

### upload a sketch

- Tools
  - Board/ATmega8
  - Processor/ATmega8
  - Programmer/USBasp

- File/Examples/Basics/Led
- Sketch/Upload

![img](/_files/atmega8-arduino-bootloaded.jpg)

### wiring notes

- refer to official datasheet for an overview of [pinout](http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-2486-8-bit-AVR-microcontroller-ATmega8_L_summary.pdf) for atmega8
- connect GND,VCC,RESET,SCK,MISO,MOSI from usbasp to atmega
- if want to use 16Mhz you need external crystal plus capacitors and use different fuses ( low:0xdf )
- LED_BUILTIN for atmega8 is PB5

## serial communication

- connect a USB to TTL UART converter ( GND, RX-to-TX, TX-to-RX )
- setup speed if needed through Serial.begin(speed) in setup() then use Serial.println(x) as usual ( I tested it actually works even at 112500baud )

## reset

- just connect a push button between reset and gnd to restart program
