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

## reclaim space

```sh
btrfs fi usage PATH
```

- FACTOR = Used / Device size * 100
- example: Used=4.46TiB and Device size=5.46TiB then FACTOR=81

```sh
btrfs balance start -dusage=FACTOR PATH &
```

- check balance status with

```sh
btrfs balance status -v PATH
```