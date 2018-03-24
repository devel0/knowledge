# cygwin install

*tools*

## install

- start installation https://www.cygwin.com/setup-x86_64.exe
- useful packages to install
  - Net/{openssh,rsync,curl,inetutils}
  - Editors/nano
  - indent
  - Web/wget
  - tree
  - jq
  - dos2unix
  - graphviz
  - util/ncdu
  - (optional): xinit,xlaunch

## cygwin keyboard setup

tune `~/.inputrc` as follow in order to allow CTRL+arrow to work in terminal mode

```
"\e[1;5D": backward-word
"\e[1;5C": forward-word
```
