# prevent unattended upgrades

## block linux upgrade

- edit `/etc/apt/apt.conf/20auto-upgrades`

```sh
APT::Periodic::Unattended-Upgrade "0";
```

- hold linux kernel

```sh
apt-mark hold linux-image-generic linux-headers-generic linux-image-$(uname -r) linux-headers-$(uname -r)
```
