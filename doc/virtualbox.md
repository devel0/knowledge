# virtualbox

*sysadmin*

## enable usb access

```
apt-get install virtualbox-ext-pack
```

add user to `vboxusers` group

## mouse wheel scroll not work with ubuntu guest

change driver to `evdev` into `/usr/share/X11/xorg.conf.d/40-libinput.conf`

```
Section "InputClass"
        Identifier "libinput pointer catchall"
        MatchIsPointer "on"
        MatchDevicePath "/dev/input/event*"
#        Driver "libinput"
        Driver "evdev"
EndSection
```
