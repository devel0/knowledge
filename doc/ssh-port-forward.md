# ssh port forward

## cheatsheet

- export to a remote server port the local port

```sh
ssh -R remote_port:localhost:local_port ssh_name
```

- export to local port a remote server port

```sh
ssh -L local_port:remote_server_ip:remote_port ssh_name
```

## keepalive ssh by service

- create `/root/scripts/test-support`

```sh
#!/usr/bin/bash

# export to user1@SERVERNAME port 2000 the local ssh port 22
# using given identity file to connect SERVERNAME:SERVERPORT
ssh -nN \
    -o ServerAliveInterval=180 \
    -o ServerAliveCountMax=2 \
    -R 2000:localhost:22 \
    -i ~/.ssh/SOMEIDENTITY.id_rsa \
    -p SERVERPORT \
    user1@SERVERNAME
```

- create `/etc/systemd/system/some.service`

```sh
[Unit]
Description=support test
After=network.target
StartLimitIntervalSec=0

[Service]
Type=simple
Restart=always
RestartSec=10
User=root
ExecStart=/root/scripts/test-support

[Install]
WantedBy=multi-user.target
```

- start svc `service some start`

## replicate a remote ip:port to local network

- given a remotehost:port that is accessible from a remote ssh host
- in order to replicate the same address remotehost:port into local network

- create tuntap network to hold remotehost ip address

(example: remotehost/net = 10.10.5.2/30 )

```sh
ip tuntap add mode tun dev tun0
ip a add 10.10.5.2/30 dev tun0
ip link set dev tun0 up

# test route get
ip r get 10.10.5.2
```

- connect remotehost:port to local network (tun0)

```sh
# -L bindaddress:port:host:hostport
ssh -L 10.10.5.2:5432:10.10.5.2:5432 main-remote
```
