# chroot env

given a root filesystem /ROOT

```sh
mount --rbind /sys /ROOT/sys
mount --rbind /dev /ROOT/dev
mount -t proc /proc /ROOT/proc
chroot /ROOT /bin/bash
```

when finished

```sh
umount -l /ROOT/proc
umount -l /ROOT/sys
umount -l /ROOT/dev
```