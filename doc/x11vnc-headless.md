# x11vnc headless

- on target machine

```sh
apt install x11vnc xvfb openbox
```

- on client machine ( configure ssh config `~/.ssh/config` to allow ssh TARGET enter target machine directly through keyfile )

```sh
ssh -L 5900:localhost:5900 TARGET "x11vnc -create -env FD_PROG=/usr/bin/openbox -nopw -listen 127.0.0.1"
```
