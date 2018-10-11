# vscode-arduino

*arduino*

## setup

note: change paths accordingly your local installation

- install vscode
- open a sketch (.ino file ) and install proposed extension
- vscode settings `ctrl+,`
  - `arduino.path` set to `/home/devel0/softcollect.public/arduino/arduino-1.8.7`
  - `c_cpp.intellisenseengine` set to `Tag Parser`
- in the bottom toolbar choose
  - **board** ( eg. ESP8266 nodemcu )
  - **programmer** ( eg. AVRISP mkII )

## troubleshoot

- cannot open serial ( may you have read-write permission as `dialout` group but still receive error you can set 666 only for usb serial arduino adapter ) :
  - `/etc/udev/rules.d/99-arduino-usb.rules`

```
SUBSYSTEMS=="usb", ATTRS{idVendor}=="1a86", ATTRS{idProduct}=="7523", MODE="0666"
```

  - check your idVendor:idProduct through `lsusb`

## usage

- upload sketch ( ctrl+alt+u )
- open serial monitor ( ctrl+shift+p `open serial monitor` ) will visible in output / serial monitor
