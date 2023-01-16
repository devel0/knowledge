# kubuntu 22.04

## enable tag in dolphin

- enable KDE Settings/File Search

after fs indexed reopen dolphin and a new Tags appears in the left bar.

notes:
- files can tagged by right click on entry Assign Tags
- tags can be viewed from cmdline using `getfattr -d FILE`

## install nvidia driver

```sh
kubuntu-driver-manager
```

## troubleshoot

### laptop builtin monitor not work

```sh
mv /etc/X11/xorg.conf /etc/X11/xorg.conf-tmp
systemctl restart display-manager
```
