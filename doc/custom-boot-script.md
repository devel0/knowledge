# custom boot script

- edit file `/scripts/custom-boot-script`

```sh
#!/bin/bash

echo "$(date): custom boot" > /root/custom-boot.log

# ...

echo "$(date): more log" >> /root/custom-boot.log
```

- make it executable

```sh
chmod +x /scripts/custom-boot-script
```

- edit unit file `/lib/systemd/system/custom-boot.service`

```
[Unit]
Description=Custom boot script service
Requires=docker.service
After=docker.service

[Service]
ExecStart=/scripts/custom-boot-script
Type=oneshot
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
```

- install

```sh
systemctl daemon-reload
systemctl enable custom-boot.service
```
