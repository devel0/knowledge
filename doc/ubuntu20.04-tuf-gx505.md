# ubuntu 20.04 on tuf gx505

follow these steps for a successful install of Ubuntu 20.04 on a tuf gx505ge ( nvidia gtx 1050ti )

- insert pendrive and bootstrap choosing uefi from pendrive partition boot ( press esc to choose boot override )
- choose ubuntu safe graphics
- install without selecting addictional driver
- reboot
- at grub menu press "e" on ubuntu then from editor append `nouveau.modeset=0` on kernel parameters then ctrl+x to start with that override
- blacklist nouveau by editing `/etc/modprobe.d/blacklist-nvidia-nouveau.conf`
```
blacklist nouveau
options nouveau modeset=0
```
- start software & update and choose nvidia-440
- reboot
- again at grub, press "e" on ubuntu then append `nomodeset` then ctrl+x to start
- issue `sudo rm -f /etc/X11/xorg.conf`
- reboot
