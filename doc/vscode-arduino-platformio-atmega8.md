# vscode arduino platformio atmega8

to enable upload thourgh usbasp using vscode platformio on an atmega328p there is the need to set platformio.ini

```ini
[env:ATmega8A]
platform = atmelavr
board = ATmega8
framework = arduino
upload_protocol = custom
upload_port = usb
upload_flags = 
        -C
        $PROJECT_PACKAGES_DIR/tool-avrdude/avrdude.conf
        -p
        $BOARD_MCU
        -P
        $UPLOAD_PORT
        -c
        usbasp
upload_command = avrdude $UPLOAD_FLAGS -U flash:w:$SOURCE:i
board_build.f_cpu = 8000000L
# follow is 8A internal 8mhz fuses
board_fuses.hfuse = 0xDB
board_fuses.lfuse = 0xE4
board_fuses.efuse = 0xFF
```
