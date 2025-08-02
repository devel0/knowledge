# loopback device

## mount

```sh
losetup -fP myfile
```

- option `-f` : find first avail loop device
- option `-P` : auto scan for parts

## show all loop devices

```sh
losetup -a
```

## search for a loop dev attached to a file

```sh
losetup --list | grep fullpath-of-loopfile | awk '{print $1}'
```

## detach loop device

```sh
losetup -d /dev/loopXX
```
