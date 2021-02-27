# bluetooth

## scan devices

```sh
$ hcitool scan
Scanning ...
	98:D3:71:F5:F5:BE	HC-05
```

## query services available

```sh
$ sdptool browse 98:D3:71:F5:F5:BE
Browsing 98:D3:71:F5:F5:BE ...
```

## query channels of services

```sh
$ sdptool records 98:D3:71:F5:F5:BE

Service Name: SPP Dev
Service RecHandle: 0x10000
Service Class ID List:
  "Serial Port" (0x1101)
Protocol Descriptor List:
  "L2CAP" (0x0100)
  "RFCOMM" (0x0003)
    Channel: 1
Language Base Attr List:
  code_ISO639: 0x656e
  encoding:    0x6a
  base_offset: 0x100
```

## receive serial data

### connect

```sh
$ rfcomm connect 0 98:D3:71:F5:F5:BE
Connected /dev/rfcomm0 to 98:D3:71:F5:F5:BE on channel 1
Press CTRL-C for hangup
```

### bind channel

```sh
sudo rfcomm bind 0 98:D3:71:F5:F5:BE 1
```

if get device or resource busy

```sh
$ sudo rfcomm release 0
$ sudo rfcomm bind 0 98:D3:71:F5:F5:BE 1
```

### receive data

you have to be in `dialout` group to access /dev/rfcommXX

```sh
$ minicom -D /dev/rfcomm0 -b 9600
```
