# replace raid md damaged disk

## introduction

hypotesis:
- raid /dev/md0
- disk /dev/sda ( SSD cache disk )
- raid member disks ( /dev/sdb, ... )
- broken disk /dev/sdb

## howto

follow some useful notes for damaged raid disk substitution:

- retrieve a new disk with at least the same capacity of thoese installed
- identify which disk is broken ( raid system will remove automatically the disk from the set as you can verify with follow command )

```
mdadm --detail /dev/md0
```

  - raid state : clean, degraded
  - disk state : removed

- disk removal : as already stated the system remove damaged disk from the set, btw if you want to ensure or force disk removal proceed with follow

```
mdadm --remove /dev/md0 /dev/sdb2
```

where /dev/sdb2 is the partition raid connected to disk to remove

- write down serial of new disk to ease identification when you need to reconnect raid

- shutdown server, remove broken disk, insert the new one, poweron the server

- check which device is with following

```
# lsblk -o NAME,SERIAL,SIZE --nodeps
NAME SERIAL            SIZE
sda  wwuuiiooppwwaassd 232.9G
sdb  xxyyzza1          3.7T
sdc  xxyyzza2          3.7T
sdd  xxyyzza3          3.7T
sde  xxyyzza4          3.7T
sdf  xxyyzza5          3.7T
```

- **suppose that new disk is sdb**

  - copy partition from a valid disk ( not from SSD sda ), for example from source disk sdc; follow command will copy partition from sdc to sdb

```
sgdisk -R=/dev/sdb /dev/sdc
```

  - reset disk guid

```
sgdisk -G /dev/sdb
```

  - add disk to raid

```
mdadm --add /dev/md0 /dev/sdb2
```

  - install grub

```
grub-install /dev/sdb
update-grub
update-initramfs -u
```

- verify rebuild started

```
cat /proc/mdstat
```
