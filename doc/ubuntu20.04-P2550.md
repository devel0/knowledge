# ubuntu 20.04 asus P2550

## kernel param

- to avoid false boot add `dis_ucode_ldr` to `/etc/default/grub`

```
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash dis_ucode_ldr"
```

then issue `update-grub`
