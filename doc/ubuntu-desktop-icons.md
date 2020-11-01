# ubuntu desktop icons

for some reason desktop icon not available on 20.04, to reenable:

```sh
apt install gnome-shell-extension-prefs gnome-shell-extension-desktop-icons
```

then enable with `gnome-shell-extension-prefs` and logout/reenter

## link on desktop

until create link on desktop will reenable a workaround is to create symlink from shell, eg

```
cd ~/Desktop
ln -s <SOURCE>
```

this will create a link to given source in the desktop
