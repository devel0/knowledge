# vscode troubleshoot

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
