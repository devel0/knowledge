# UM34C linux log

## prerequisites

- pair device ( pin: 1234 )
- retrieve device address `echo paired-devices | bluetoothctl`
- connect to serial `rfcomm bind 0 aa:bb:cc:dd:ee:ff`
- install python bluetooth lib `python3 -m pip install pybluez`
- install [rd-usb](https://github.com/kolinger/rd-usb)

## docker version

- see [this project](https://github.com/devel0/docker-um34c)
