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
```

## add templates to nautilus (right click)

add files to `~/Templates` then right click -> New Document -> your template

example `touch "~/Templates/Text Document.txt"`
