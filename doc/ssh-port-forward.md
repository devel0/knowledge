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
