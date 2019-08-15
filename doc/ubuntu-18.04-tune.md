# ubuntu 18.04 tune

*sysadmin*

## touchpad right click not work

```
gsettings set org.gnome.desktop.peripherals.touchpad click-method areas
```

## monitor sysload util

```
apt install gnome-shell-extension-system-monitor
```

- to see changes use `gnome-shell-extension-prefs` / config then switch off-on

## shutter edit

to enable shutter edit follow this [instructions](https://www.linuxuprising.com/2018/04/fix-shutter-edit-button-greyed-out-in.html) ; **be careful** to execute 32bit or 64bit instruction version depending on your ( `uname -i` )

## modal window detach

through gnome tweaks search modal then turn off Attach Modal Dialogs

## flatpak software manager

- [Ubuntu Install instructions](https://flatpak.org/setup/Ubuntu/)

## wifi auth error if lid closed

- [workaround](https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1288003)

## disable lid sleep

- edit `/etc/systemd/logind.conf'

```
HandleLidSwitch=ignore
```

- restart sevice `systemctl restart systemd-logind`

## customize menu

```
apt install alacarte
```

## thunderbird huge font fix

- copy font and restart thunderbird

```
/usr/share/fonts/truetype/noto
wget https://github.com/googlei18n/noto-emoji/raw/master/fonts/NotoEmoji-Regular.ttf
```

## useful aliases

in `~/.bashrc`

```
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias fs='nautilus'
alias fso='xdg-open'
```

- `fs` open nautilus focusing path if specified
- `fso` open associated application with given pathfilename specified as argument

## add templates to nautilus (right click)

add files to `~/Templates` then right click -> New Document -> your template

example `touch "~/Templates/Text Document.txt"`

## install nextcloud

- install `libgnome-keyring0`
- download appimage into softcollect.public/nextcloud-client and make it executable
- start the first time and ask yes to integration ( this will create startup app entry )
- create a run.sh as follow

```sh
#!/bin/bash

~/softcollect.public/nextcloud-client/delayed-startup.sh &
```

- create a delayed-startup.sh as follow

```sh
#!/bin/bash

sleep 60

~/softcollect.public/nextcloud-client/Nextcloud-2.3.3-x86_64.AppImage &
```

- launch Startup Application Preferences and edit and change Nextcloud command to your home ~/softcollect.public/nextcloud-client/run.sh

## install kdeconnect

- through ubuntu software

## install freecad

- download appimage into softcollect.public/freecad and make it executable

## codec to play mp4

- from ubuntu center install GStreamer Multimedia codecs "good"

## nautilus scripts

- add gnome contextual [menu actions](https://github.com/devel0/linux-scripts-utils/tree/bf3f1a394cfdeb66439ee5f5a6e8a65c5422be91#nautilus-scripts)

## gstreamer plugins

```
apt install gstreamer1.0-plugins-bad
```

## change default app

- right click on file -> properties
- open/with / set as default

## force monitor mode

- [force monitor mode](http://ubuntuhandbook.org/index.php/2017/04/custom-screen-resolution-ubuntu-desktop/)
