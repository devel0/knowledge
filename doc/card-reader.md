# card reader

## install

- apt install libacsccid1 pcscd opensc
- firefox / preferences /privacy & security -> Security Devices -> load module `/usr/lib/x86_64-linux-gnu/opensc-pkcs11.so`

## commands

```sh
pkcs15-tool --list-info
```
