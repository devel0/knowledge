# usb and udev

- [get info from usb device](#get-info-from-usb-device)
- [reload udev](#reload-udev)
- [other refs](#other-refs)

## get info from usb device

```sh
lsbusb -t
```

retrieve all variables belonging a device, ie `/dev/ttyUSB0` to build a rule

```sh
udevadm info -a -p $(udevadm info -q path -n /dev/ttyUSB0)
```

and

```sh
udevadm -n /dev/ttyUSB --attribute-walk
```

example rule

```sh
KERNEL=="ttyUSB[0-9]*", SUBSYSTEM=="tty", ATTRS{idVendor}=="067b", ATTRS{idProduct}=="2303", SYMLINK+="ttyUSB-$attr{devpath}"
```

generates two different by usb path ( physical port ) devices for the same vid, pid

```sh
lrwxrwxrwx 1 root root         7 gen 15 00:23 /dev/ttyUSB-4 -> ttyUSB0
lrwxrwxrwx 1 root root         7 gen 15 00:23 /dev/ttyUSB-5 -> ttyUSB1
```

## reload udev

```sh
udevadm control --reload-rules ; udevadm trigger
```

## other refs

- view usb devices hierarchy `lsbusb -tv`
- [reset usb device](https://askubuntu.com/a/1036410)