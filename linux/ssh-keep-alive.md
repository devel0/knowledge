# ssh keep alive

*syadmin*

## client alive interval

- edit `~/.ssh/config`

```
ServerAliveInterval 120
```

## server side client alive interval

- edit `/etc/ssh/sshd_config`

```
ClientAliveInteval 120
ClientAliveCountMax 1000
```

client will pinged for a max timeout of 120 * 1000 secs ( about 33 hr )
