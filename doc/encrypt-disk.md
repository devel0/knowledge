# encrypt disk

```sh
cryptsetup -v -y luksFormat /dev/sdX1
cryptsetup luksOpen /dev/sdX1 mydrive
mkfs.my /dev/mapper/mydrive
```
