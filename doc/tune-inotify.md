# tune inotify

error that can thrown an application

```
The configured user limit (128) on the number of inotify instances has been reached, or the per-process limit on the number of open file descriptors has been reached.
```

or

```
Error: EMFILE: too many open files
```

edit `/etc/sysctl.d/99-custom.conf` as follow to expand inotify watched to 1million ( each consume 1kb )

```sh
fs.inotify.max_user_watches = 1048576 # default: 30003
fs.inotify.max_user_instances = 524288 # default: 128
```

reload using follow

```sh
sysctl -p /etc/sysctl.d/99-custom.conf
```

related: filesystem watches
