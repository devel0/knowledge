# ubuntu 20.04 on tuf gx505

<!-- TOC -->
* [mouse rectangle](#mouse-rectangle)
* [python](#python)
* [keyboard led colors](#keyboard-led-colors)
* [nautilus preview not work](#nautilus-preview-not-work)
* [document viewer max zoom](#document-viewer-max-zoom)
* [force recent on nautlis sidebar](#force-recent-on-nautlis-sidebar)
<!-- TOCEND -->

<hr/>

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

if got trouble just after filesystem check that system freeze try follow in `/etc/default/grub`

```
GRUB_CMDLINE_LINUX_DEFAULT="nouveau.modeset=0 snd_hda_intel.dmic_detect=0 vga=0 quiet splash"
```

## mouse rectangle

if you got a rectangle around mouse, it may related to this [bug](https://bugs.launchpad.net/ubuntu/+source/meta-gnome3/+bug/1872870) ; as a workaround disable universal access zoom feature.

## python

to solve `AttributeError: module 'importlib._bootstrap' has no attribute 'SourceFileLoader'` error

```sh
sudo python3 -m pip uninstall setuptools
```

## keyboard led colors

see [faustus](https://github.com/hackbnw/faustus) ; after install call set_rgb.sh script to config keyboard leds

## nautilus preview not work

if need preview for large image file please check your `Preferences / Search & Preview / Thumbnails: only for files smaller than: XX MB`

## document viewer max zoom

to allow zoom more than 400%

```sh
gsettings set org.gnome.Evince page-cache-size 2014

```

## force recent on nautlis sidebar

- when saveAs and want to access recent can press Alt-R
- another way is to place a bookmark to recent adding `recent:///` to `~/.config/gtk-3.0/bookmarks`