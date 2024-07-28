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

## other useful flags

```sh
[Service]
User=username
Group=groupname
SyslogIdentifier=somename
KillSignal=SIGINT
EnvironmentFile=/root/security/secrets.env
```

## commands

| command          | description                                      |
| ---------------- | ------------------------------------------------ |
| daemon reload    | `systemctl daemon-reload`                        |
| install service  | `systemctl enable SERVICENAME`                   |
| start service    | `systemctl SERVICENAME start`                    |
| stop service     | `systemctl SERVICENAME stop`                     |
| check log follow | `journalctl -u SERVICENAME -f`                   |
| check log since  | `journalctl -u SERVICENAME --since "1 days ago"` |
|                  |                                                  |
