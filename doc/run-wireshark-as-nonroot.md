# run wireshark as non root

*[networking](../README.md#networking)*

## install

```sh
apt install wireshark
dpkg-reconfigure wireshark-common
useradd myuser wireshark
chmod 4711 /usr/bin/dumpcap
```

- logout and re-enter
