# kubuntu 22.04

<!-- TOC -->
* [enable tag in dolphin](#enable-tag-in-dolphin)
* [install nvidia driver](#install-nvidia-driver)
* [troubleshoot](#troubleshoot)
  + [laptop builtin monitor not work](#laptop-builtin-monitor-not-work)
  + [nvidia driver sleep/resume not work](#nvidia-driver-sleepresume-not-work)
<!-- TOCEND -->

## enable tag in dolphin

- enable KDE Settings/File Search

after fs indexed reopen dolphin and a new Tags appears in the left bar.

notes:
- files can tagged by right click on entry Assign Tags
- tags can be viewed from cmdline using `getfattr -d FILE`

## install nvidia driver

```sh
kubuntu-driver-manager
```

## troubleshoot

### laptop builtin monitor not work

```sh
mv /etc/X11/xorg.conf /etc/X11/xorg.conf-tmp
systemctl restart display-manager
```

### nvidia driver sleep/resume not work

behavior: after suspend, the resume unable to back again ( black screen )

to solve, install latest production driver ( manually )

- download from : https://www.nvidia.com/en-us/drivers/unix/
- ( I tested with `525.89.02` https://www.nvidia.com/Download/driverResults.aspx/199656/en-us/ )

if running a nouveau driver could switch to textmode temporarly:
- `sudo systemctl set-default multi-user && sudo reboot`
- login then
- `sudo rmmod nouveau`
- run the installer from download dir
- back to graphical mode `sudo systemctl set-default graphical && sudo reboot`
- login and select prime nvidia `sudo apt install -y nvidia-prime && sudo prime-select nvidia`
- reboot, now sleep/resume work
