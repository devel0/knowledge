# ubuntu locale and timezone

assume for example:
- date/time in it_IT with Europe/Rome timezone
- messages, numbers and all the others in en_US

- install required packages

```sh
apt install locales
```

- generate locales for en, it

```sh
locale-gen en_US.UTF-8 it_IT.UTF-8
```

- view current settings

```sh
locale
```

- set default lang en while set time to it

```sh
update-locale LC_TIME=it_IT.UTF-8
```

this will change `/etc/default/locale` as follows

```sh
LANG=C.UTF-8
LC_TIME=it_IT.UTF-8
```

- set the Europe/Rome timezone

```sh
timedatectl set-timezone Europe/Rome
```

this will change `/etc/timezone` as follows

```
Europe/Rome
```

- all at once

```sh
apt install locales
locale-gen en_US.UTF-8 it_IT.UTF-8
update-locale LC_TIME=it_IT.UTF-8
timedatectl set-timezone Europe/Rome
```

- for desktop environment you might need to comment out settings in `~/.pam_environment`
