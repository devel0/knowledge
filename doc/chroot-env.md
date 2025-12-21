# chroot env

given a root filesystem /ROOT

```sh
mount -t proc proc /ROOT/proc
mount -t sysfs /sys /ROOT/sys
mount --bind /dev /ROOT/dev
mount --bind /dev/pts /ROOT/dev/pts
chroot /ROOT /bin/bash
```

when finished

```sh
umount -l /ROOT
```
