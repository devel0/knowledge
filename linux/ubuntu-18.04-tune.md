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
