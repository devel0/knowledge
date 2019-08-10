# ubuntu server post install

## tune bashrc

`/etc/bash.bashrc`

```
# custom

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

HISTSIZE=1000000
HISTFILESIZE=2000000

export PATH=$PATH:/opt/node/bin

export DOTNET_ROOT=/opt/dotnet
export PATH=$PATH:$DOTNET_ROOT
export DOTNET_CLI_TELEMETRY_OPTOUT='1'

export PATH=$PATH:~/.dotnet/tools
export PATH=$PATH:/nas/scripts
```

## docker

- [disable iptables](docker-without-iptables.md)

## inotify

- [tune inotify](tune-inotify.md)
