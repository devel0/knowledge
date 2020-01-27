# virtualbox

*[linux](../README.md#linux)*

## enable usb access

```sh
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

## connect physical disk

```sh
vboxmanage internalcommands createrawvmdk -filename phdiskmap.vmdk -rawdisk /dev/sdDEV
```

## transfer image to physical disk

```sh
VBoxManage clonehd --format RAW disk.vdi out.raw
dd if=disk.vdi of=/dev/sdDEV bs=4k
```
to copy out.raw to device linux [clone-disk](https://github.com/devel0/clone-disk) or win [win32diskimager](https://sourceforge.net/projects/win32diskimager/) can be used

to use clone-disk a loop setup need to be done first with

```sh
losetup -f out.raw
losetup -a | grep out.raw
```

then use /dev/loopXX resulting from `losetup -a` as source
