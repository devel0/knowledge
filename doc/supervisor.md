# supervisor

- config files in `/etc/supervisor/conf.d`

## example

```conf
[program:myprog]
command=/scripts/myprog.sh
directory=/scripts
autostart=true
autorestart=true
startretries=50
stderr_logfile=/var/log/myprog.err.log
stdout_logfile=/var/log/myprog.out.log
user=root
stopasgroup=true
killasgroup=true
```

where `/scripts/myprog.sh` could be

```sh
#!/usr/bin/env bash

PATH=$PATH:/opt/dotnet

dotnet /utils/myprog/bin/Debug/net7.0/myprog.dll
```