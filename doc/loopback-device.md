# loopback device

## create

```sh
losetup -fP myfile
```

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
