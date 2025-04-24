# journalctl

- [log errors](#log-errors)
- [log service live](#log-service-live)
- [log service since](#log-service-since)
- [get size](#get-size)
- [vacuum](#vacuum)

## log errors

log errors paged `journalctl -xe --pager`

## log service live

```sh
journalctl -u UNIT -f
```

## log service since

```sh
journalctl -u UNIT --since "10 min ago"
journalctl -u UNIT --since "10 hour ago"
journalctl -u UNIT --since "10 day ago"
```

## get size

```sh
journalctl --disk-usage
```

## vacuum

remove older journal till size not below given size

```sh
journalctl --vacuum-size=200M
```