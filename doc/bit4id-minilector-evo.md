# bit4id minilector evo

## issue

- driver from bit4id actually doesn't work on Ubuntu 64bit cause the driver is a 32bit version

## solution

- install standard ubuntu [card reader](https://github.com/devel0/knowledge/blob/49ef0ebbc5aac9b6e9a9afa87c93e38120696e31/doc/card-reader.md) drivers
- edit `/usr/lib/pcsc/drivers/ifd-acsccid.bundle/Contents/Info.plist` and add your usb vid:pid ( look at `lsbusb` before and after usb connection )
  - append your vid string into `ifdVendorID` ( mine is **0x0424** )
  - append your pid string into `ifdProductID` ( mine is **0x1104** )
  - append your product friendly name into `ifdFriendlyName`
  
resulting `Info.plist` should look like follow:

```xml
        <key>ifdVendorID</key>
        <array>
                <string>0x072f</string>
...
                <string>0x072f</string>
                <string>0x0424</string>
        </array>

        <key>ifdProductID</key>
        <array>
                <string>0xb301</string>
...
                <string>0x90ce</string>
                <string>0x1104</string>
        </array>

        <key>ifdFriendlyName</key>
        <array>
                <string>ACS ACR32 ICC Reader</string>
...
                <string>IRIS SCR21U</string>
                <string>Minilector EVO</string>
        </array>
```

- restart card reader service `service pcscd restart`

## test

before to login with your card try the simple read test

```sh
pkcs15-tool --list-info
```
