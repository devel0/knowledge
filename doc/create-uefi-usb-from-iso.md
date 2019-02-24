# create uefi usb from iso

**warning** : data on /dev/sdX will destroyed

- suppose
  - `/dev/sdX` target device
  - `image.iso` source uefi iso
  - `~/tmp/uefi-usb-dst` temp usb dest folder  
  - `~/tmp/image.iso` source uefi iso image
  - `~/tmp/uefi-iso-mnt` temp uefi iso mount folder

```sh
mkdir -p ~/tmp/uefi-usb-dst ~/tmp/uefi-iso-mnt

parted --script /dev/sdX mklabel gpt
parted --script --align=optimal /dev/sdX mkpart ESP fat32 1MiB 100%
```

for linux based images
```
parted --script /dev/sdX set 1 boot on
```

for win based images
```
parted --script /dev/sdX set 1 msftdata on
```

```
mkfs.vfat -n MYLBL /dev/sdX1

mount -t vfat /dev/sdX1 ~/tmp/uefi-usb-dst
mount ~/tmp/image.iso ~/tmp/uefi-iso-mnt -o loop
rsync -arvx --delete ~/tmp/uefi-iso-mnt/ ~/tmp/uefi-usb-dst/

umount ~/tmp/uefi-iso-mnt
umount ~/tmp/uefi-usb-dst
sync
```

note: ignore chown errors
