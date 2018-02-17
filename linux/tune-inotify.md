# tune inotify

*(linux)*

edit `/etc/sysctl.d/99-custom.conf` as follow to expand inotify watched to 1million ( each consume 1kb )

```sh
fs.inotify.max_user_watches = 1048576
```

reload w/reboot using follow

```
sysctl -p /etc/sysctl.d/99-custom.conf
```
