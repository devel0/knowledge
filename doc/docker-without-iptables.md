# docker without iptables

*[linux](../README.md#linux)*

```sh
systemctl edit docker
```

put follow in the file ( you can copy ExecStart from `/lib/systemd/system/docker.service` ) ad insert `--iptables=false`

```
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd --iptables=false -H fd:// --containerd=/run/containerd/containerd.sock
```
