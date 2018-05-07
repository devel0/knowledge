# retrieve package source

*development*

## prerequisites

- uncomment one of more deb-src repository from `/etc/apt/sources.list`

## retrieve source of a package

```
mkdir /usr/src/mypackage
cd /usr/src/mypackage
apt source packagename
```
