# btrfs tools

## check filesystem

```sh
btrfs scrub start PATH
```

check errors with

```sh
dmesg --follow | grep --line-buffered "checksum error at" >> checksum_errors.txt
```

see progress

```sh
while true; do clear; btrfs scrub status PATH; sleep 30; done
```
