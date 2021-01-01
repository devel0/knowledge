# driver epson gt s50

## install driver

- [download](http://download.ebz.epson.net/dsc/search/01/search/searchModule)

## post install ( ubuntu 18.04 )

```sh
sudo ln -sfr /usr/lib/sane/libsane-epkowa* /usr/lib/x86_64-linux-gnu/sane
```

create `/etc/udev/rules.d/55-epson-libsane.rules` with follow content:

```
SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", MODE=="0666"
SUBSYSTEM=="usb_device", MODE=="0666"

ATTRS{manufacturer}=="EPSON", DRIVERS=="usb", SUBSYSTEMS=="usb", ATTRS{idVendor}=="04b8", ATTRS{idProduct}=="*", MODE="0666"

ATTRS{idVendor}=="04b8", ATTRS{idProduct}=="0137", MODE="0666", GROUP="scanner", ENV{libsane_matched}="yes"
```

- unplug/replug

- check it find scanner

```sh
scanimage -L
```

- start program

```sh
iscan
```

## reference

- [original thread](https://askubuntu.com/questions/1034528/epson-gt-s50-scanner-not-working-after-upgrade-to-18-04-from-16-04)
