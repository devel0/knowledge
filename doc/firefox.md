# firefox

## troubleshoot

### xdg-open not work

```sh
$ xdg-open http://some.com
kf.kio.gui: "Could not find the program '/snap/firefox/4173/usr/lib/firefox/firefox'"
```

to solve the issue

```sh
rm ~/.local/share/applications/userapp-Firefox*.desktop
```
