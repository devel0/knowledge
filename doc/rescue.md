# rescue

files to check when regen mkinitramfs and reinstall grub

- /etc/fstab
- /etc/crypttab
- /etc/default/grub
- /boot/efi/EFI/ubuntu/grub.cfg ( id of /boot mnt )

## troubleshoot

### EFI variables are not supported on this system

```sh
mount -t efivarfs efivarfs /sys/firmware/efi/efivars
```
