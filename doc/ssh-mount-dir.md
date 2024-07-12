# ssh mount dir

```sh
sshfs HOST:PATH MOUNTPOINT
```

## allow www-data to access

- setup `/etc/fuse.conf` uncommenting `user_allow_other`

```sh
sshfs HOST:PATH MOUNTPOINT -o uid=$(id -u www-data),allow_other,reconnect
```