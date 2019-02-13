# create uefi usb from iso

**warning** : data on /dev/sdX will destroyed

- suppose
  - `/dev/sdX` target device
  - `image.iso` source uefi iso
  - `~/tmp/usb-dst` temp usb dest folder  
  - `~/tmp/image.iso` source uefi iso image
  - `~/tmp/uefi-src` temp uefi iso mount folder

```sh
mkdir -p ~/tmp/uefi-usb-dst ~/tmp/uefi-iso-mnt

parted --script /dev/sdX mklabel gpt
parted --script --align=optimal /dev/sdX mkpart ESP fat32 1MiB 100%
parted --script /dev/sdX set 1 boot on
mkfs.vfat -n MYLBL /dev/sdX1

mount -t vfat /dev/sdX1 ~/tmp/uefi-usb-dst
mount ~/tmp/image.iso ~/tmp/uefi-src -o loop
rsync -arvx --delete ~/tmp/uefi-src/ ~/tmp/uefi-usb-dst/
```

note: ignore chown errors
