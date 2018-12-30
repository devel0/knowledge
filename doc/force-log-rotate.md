# force log rotate

```
logrotate -f /etc/logrotate.conf
```

## notes

- `tail -f /var/log/syslog` survive to log rotation and acquire new file descriptor
