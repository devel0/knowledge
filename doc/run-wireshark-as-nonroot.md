# run wireshark as non root

## install

```sh
apt install wireshark
dpkg-reconfigure wireshark-common
usermod -a -G wireshark myuser
# chmod 4711 /usr/bin/dumpcap
```

- logout and re-enter

## capture traffic remotely

`sudo tcpdump -s 0 -i enp2s0 -w tcpdump.pcap`
