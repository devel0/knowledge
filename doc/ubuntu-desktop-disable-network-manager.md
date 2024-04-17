# ubuntu desktop disable network manager

To disable network manager and use `netplan` within `renderer: networkd`

```sh
systemctl stop NetworkManager-wait-online
systemctl mask NetworkManager-wait-online

systemctl stop NetworkManager
systemctl mask NetworkManager
```

- then edit `/etc/netplan/01-network-manager-all.yaml`

```yaml
network:
  version: 2
#  renderer: NetworkManager
  renderer: networkd

  ethernets:
    enp2s0:
      dhcp4: no

  bridges:
    br0:
      dhcp4: yes
      interfaces:
        - enp2s0
#      addresses: [10.10.4.200/24]
```
