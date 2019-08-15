# force log rotate

*[linux](../README.md#linux)*

```sh
logrotate -f /etc/logrotate.conf
```

## notes

- `tail -f /var/log/syslog` survive to log rotation and acquire new file descriptor
