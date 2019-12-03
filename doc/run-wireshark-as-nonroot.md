# run wireshark as non root

*[networking](../README.md#networking)*

## install

```sh
apt install wireshark
dpkg-reconfigure wireshark-common
usermod -a -G wireshark myuser
# chmod 4711 /usr/bin/dumpcap
```

- logout and re-enter
