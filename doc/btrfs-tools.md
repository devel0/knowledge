# btrfs tools

## check filesystem

```sh
btrfs scrub start <path>
```

check errors with

```sh
dmesg --follow | grep --line-buffered "checksum error at" >> checksum_errors.txt
```
