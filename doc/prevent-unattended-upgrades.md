# prevent unattended upgrades

## block linux upgrade

- edit `/etc/apt/apt.conf/20auto-upgrades`

```sh
APT::Periodic::Unattended-Upgrade "0";
```

- hold linux kernel ( search latest of `dpkg -l | grep linux-image` )

```sh
apt-mark hold linux-image-6.8.0-35-generic linux-image-generic
```
