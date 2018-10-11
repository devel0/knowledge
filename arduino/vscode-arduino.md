# vscode-arduino

*arduino*

## setup

> *note*: change paths accordingly your local installation

- install vscode
- open a sketch (.ino file ) and install proposed extension
- vscode settings
  - `ctrl+, arduino.path` set to `/home/devel0/softcollect.public/arduino/arduino-1.8.7`
  - `ctrl+, c_cpp.intellisenseengine` set to `Tag Parser`
- restart vscode
- `ctrl+shift+p arduino change board` select your programmer board ( eg. ESP8266 nodemcu )
- in the bottom toolbar choose programmer ( eg. AVRISP mkII )

## usage

- upload sketch ( ctrl+alt+u )
- open serial monitor ( ctrl+shift+p `open serial monitor` ) will visible in output / serial monitor

## libraries and includes

- edit file `.vscode/c_cpp_properties.json`
- changing board basic include header will inserted, example:

```
"/home/devel0/.arduino15/packages/esp8266/tools/**",
"/home/devel0/.arduino15/packages/esp8266/hardware/esp8266/2.4.2/**"
```

- path to arduino local installation libraries must inserted, example:

```
"/home/devel0/Arduino/libraries/**"
```

- to modularize code you can include header from other custom libraries and to make arduino compile-time to work it's needed to symlink your library in local arduino liraries path, example:

```
cd ~/Arduino/libraries
ln -s /opensource/devel0/iot-arduino-utils/arduino-utils
```

## troubleshoot

- to cleanup vscode cache and local config entirely just `rm -fr ~/.config/Code`
- cannot open serial ( may you have read-write permission as `dialout` group but still receive error you can set 666 only for usb serial arduino adapter ) :
  - `/etc/udev/rules.d/99-arduino-usb.rules`

```
SUBSYSTEMS=="usb", ATTRS{idVendor}=="1a86", ATTRS{idProduct}=="7523", MODE="0666"
```

  - check your idVendor:idProduct through `lsusb`
