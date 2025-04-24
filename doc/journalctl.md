# journalctl

## log errors

log errors paged `journalctl -xe --pager`

## get size

```sh
journalctl --disk-usage
```

## vacuum

remove older journal till size not below given size

```sh
journalctl --vacuum-size=200M
```