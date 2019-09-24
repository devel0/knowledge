# vscode troubleshoot

*[development tools](../README.md#development-tools)*

## intellinsense not work any more

```
rm -fr ~/.vscode
```

## xrdp

- using Ubuntu through xrdp if receive an `Xlib: extension "XInputExtension" missing on display` error try with following

```sh
cp -f /usr/lib/x86_64-linux-gnu/libxcb.so.1 /usr/lib/x86_64-linux-gnu/libxcb.so.1.orig
sed -i 's/BIG-REQUESTS/_IG-REQUESTS/' /usr/lib/x86_64-linux-gnu/libxcb.so.1
```

## trouble with 3.0

if intellisense doesn't work and output shows `The SDK 'Microsoft.NET.Sdk' specified could not be found` try adding an `omnisharp.json` file at solution root with follow content

```json
{
    "MsBuild": {
        "UseLegacySdkResolver": true
    }
}
```
