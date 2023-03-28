# ubuntu 22.04 tune

## problem with CTRL period

If using CTRL+'.' shows a underline e may emoj preedit area active, to disable check [this post](https://superuser.com/a/1687344/1176360)

## login gdm on wrong monitor

```sh
cp /home/USERNAME/.config/monitors.xml /var/lib/gdm3/.config/
chown gdm:gdm /var/lib/gdm3/.config/monitors.xml
```

## problem wheel jump with ALT+TAB

- workaround [here](https://dev.to/bbavouzet/ubuntu-20-04-mouse-scroll-wheel-speed-536o)

## second monitor stop working with nvidia

- from Ubuntu Software app
- select nvidia-515 (tested) or use `sudo prime-select nvidia` if already installed

## primary monitor stop working with nvidia

```sh
ubuntu-drivers install
```
