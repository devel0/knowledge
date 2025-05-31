# udev-rules

## file names

- rules are processed in alphabetical order
- custom rules can be placed into `/etc/udev/rules.d`
- to be considered file must ends with `.rules`

## force an stm32 device to a specific ttyACM

- follow create `/dev/ttyACM-MY` symlink to ACM0, ACM1, ... depending on match serialnr
- to see actual parameters for a connected ttyACM0 use `udevadm info -a /dev/ttyACM0`

```udev
KERNEL=="ttyACM[0-9]*", SUBSYSTEM=="tty", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="374b", ATTRS{serial}=="serialnr", SYMLINK="ttyACM-MY"
```

## detect event dev from 

search in `/proc/bus/input/devices` and event device is in `H: eventX`

## create symlink for serial device

```udev
# ftdi FT232
KERNEL=="ttyUSB[0-9]*", SUBSYSTEM=="tty", ATTRS{idVendor}=="0403", ATTRS{idProduct}=="6001", SYMLINK+="ttyUSB-ft232"

# prolific PL2303
KERNEL=="ttyUSB[0-9]*", SUBSYSTEM=="tty", ATTRS{idVendor}=="067b", ATTRS{idProduct}=="2303", SYMLINK+="ttyUSB-pl2303"

# ch340
#KERNEL=="ttyUSB[0-9]*", SUBSYSTEM=="tty", ATTRS{idVendor}=="1a86", ATTRS{idProduct}=="7523", SYMLINK+="ttyUSB-ch340"
```

## reload udev rules

```sh
udevadm control --reload-rules ; udevadm trigger
```

## print rules from device

```sh
udevadm info -a /dev/DEVICE
```