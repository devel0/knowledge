# ubuntu 22.04 tune

## problem with CTRL period

If using CTRL+'.' shows a underline e may emoj preedit area active, to disable check [this post](https://superuser.com/a/1687344/1176360)

## login gdm on wrong monitor

```sh
cp /home/USERNAME/.config/monitors.xml /var/lib/gdm3/.config/
chown gdm:gdm /var/lib/gdm3/.config/monitors.xml
```

## problem wheel jump with ALT+TAB

- discussion [here](https://github.com/microsoft/vscode/issues/28795#issuecomment-1172222646)
