# wake on lan

## verify support

```sh
ethtool IFNAME | grep -i wake
```

if supported `Wake-on: g`

if not can be enabled with `sudo ethtool -s <NIC> wol g`

## send magic packet

```sh
apt install wakeonlan
```

then

```sh
wakeonlan MACADDR
```

## references

- [wake on lan](https://wiki.archlinux.org/title/Wake-on-LAN)