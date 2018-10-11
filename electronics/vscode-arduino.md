# vscode-arduino

*arduino*

## setup

note: change paths accordingly your local installation

- install vscode
- open a sketch (.ino file ) and install proposed extension
- `ctrl+,` Arduino path set to `/home/devel0/softcollect.public/arduino/arduino-1.8.7`
- in the bottom toolbar choose board ( eg. ESP8266 nodemcu )
- ctrl+shift+p `c/cpp edit configurations` append `/home/devel0/Arduino/libraries/**`
- if use esp8266 nodemcu add to top `/home/devel0/.arduino15/packages/esp8266/hardware/esp8266/2.4.2/variants/nodemcu` in order to load correctly pin definitions D0, D1, ...
- in the bottom toolbar choose programmer ( eg. AVRISP mkII )

## troubleshoot

- cannot open "WProgram.h" ( just add `#define ARDUINO 10807` to top of your code )
- cannot open serial ( may you have read-write permission as `dialout` group but still receive error you can set 666 only for usb serial arduino adapter ) :
  - `/etc/udev/rules.d/99-arduino-usb.rules`

```
SUBSYSTEMS=="usb", ATTRS{idVendor}=="1a86", ATTRS{idProduct}=="7523", MODE="0666"
```

  - check your idVendor:idProduct through `lsusb`

## usage

- upload sketch ( ctrl+alt+u )
- open serial monitor ( ctrl+shift+p `open serial monitor` ) will visible in output / serial monitor
