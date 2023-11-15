# linux systemd services

## create service file

edit `/etc/systemd/system/SERVICENAME.service` file:

```conf
[Unit]
Description=service description
After=network.target
StartLimitIntervalSec=0

[Service]
Type=simple
Restart=always
RestartSec=1
User=root
ExecStart=PATHTOPROGRAM

[Install]
WantedBy=multi-user.target
```

note: if edit further the service file `systemctl daemon-reload` required

## install service

```sh
systemctl enable SERVICENAME
```

## enable service

```sh
service SERVICENAME start
```

## check service status

```sh
service SERVICENAME status
```

## show service log

```sh
journalctl -u SERVICENAME
```

