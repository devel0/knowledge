# nextcloud

## ignore folders

on the client side edit a .sync-exclude.lst ( or 3dots menu -> edit ignored files ) ; for example to exclude node_modules folders use something like follow:

```
node_modules/*
```

## server side rescan

```sh
sudo -u www-data php occ files:scan --all -v
```
