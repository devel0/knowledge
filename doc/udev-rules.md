# udev-rules

## force an stm32 device to a specific ttyACM

- follow create `/dev/ttyACM-MY` symlink to ACM0, ACM1, ... depending on match serialnr
- to see actual parameters for a connected ttyACM0 use `udevadm info -a /dev/ttyACM0`

```udev
KERNEL=="ttyACM[0-9]*", SUBSYSTEM=="tty", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="374b", ATTRS{serial}=="serialnr", SYMLINK="ttyACM-MY"
```
