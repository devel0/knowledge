# ubuntu server post install

<!-- TOC -->
- [ubuntu server post install](#ubuntu-server-post-install)
  * [tune bashrc](#tune-bashrc)
  * [automatic disk decryption](#automatic-disk-decryption)
  * [docker](#docker)
  * [inotify](#inotify)
  * [dircolors and prompt](#dircolors-and-prompt)
    + [workstation](#workstation)
    + [server](#server)
  * [disable systemd-resolved](#disable-systemd-resolved)
<!-- TOCEND -->

<hr/>

## tune bashrc

`/etc/bash.bashrc`

```
# custom

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

export HISTSIZE=1000000
export HISTFILESIZE=2000000

export PATH=$PATH:/opt/node/bin

export DOTNET_ROOT=/opt/dotnet
export PATH=$PATH:$DOTNET_ROOT
export DOTNET_CLI_TELEMETRY_OPTOUT='1'
export PATH=$PATH:~/.dotnet/tools

# python modules
export PATH=$PATH:~/.local/bin

export PATH=$PATH:/nas/scripts
```

## automatic disk decryption

- [luks keyfile for automount](encrypt-disk.md#use-keyfile-for-automount)

## docker

- [disable iptables](docker-without-iptables.md)

## inotify

- [tune inotify](tune-inotify.md)

## dircolors and prompt

follow to set a directory color a little brigther than the effect of blue on purple terminal background

- `~/.dircolors`

```
DIR 00;36
LINK 00;33
```

### workstation

- root `~/.bashrc`

```
PS1='${debian_chroot:+($debian_chroot)}\[\033[48;5;27m\]\[\033[01;37m\]\u@\h\[\033[00m\]:\[\033[00;36m\]\w\[\033[00m\]\$ '
```

- user: `~/.bashrc`

```
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;37m\]\u\[\033[00m\]@\[\033[38;5;11m\]\h\[\033[00m\]:\[\033[00;36m\]\w\[\033[00m\]\$ '
```

### server


- root `~/.bashrc`

```
PS1='${debian_chroot:+($debian_chroot)}\[\033[48;5;1m\]\[\033[01;37m\]\u@\h\[\033[00m\]:\[\033[00;36m\]\w\[\033[00m\]\$ '
```

- user: `~/.bashrc`

```
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;37m\]\u\[\033[00m\]@\[\033[48;5;9m\]\[\033[38;5;15m\]\h\[\033[00m\]:\[\033[00;36m\]\w\[\033[00m\]\$ '
```

## disable systemd-resolved

```sh
systemctl disable systemd-resolved
systemctl stop systemd-resolved
rm -f /etc/resolv.conf
```

create your own `/etc/resolv.conf`

```
nameserver xxx.yyy.zzz.www
search example.com
```

edit `/etc/NetworkManager/NetworkManager.conf` to stop update resolv.conf

```
[main]
dns=none
```
