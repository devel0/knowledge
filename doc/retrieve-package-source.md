# retrieve package source

*[linux](../README.md#linux)*

## prerequisites

- uncomment one of more deb-src repository from `/etc/apt/sources.list`

## retrieve source of a package

```sh
mkdir /usr/src/mypackage
cd /usr/src/mypackage
apt source packagename
```
