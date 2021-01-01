# su with sudo prompt

## become superuser

```sh
sudo -i
```

## setup root coloured prompt

- set `/root/.bashrc`

```sh
PS1='${debian_chroot:+($debian_chroot)}\[\033[48;5;33m\]\[\033[01;37m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
```
