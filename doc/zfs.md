# zfs

- [create filesystem](#create-filesystem)
- [create zfs slot](#create-zfs-slot)
- [set acl](#set-acl)
- [set mountpoint](#set-mountpoint)
- [take snapshot](#take-snapshot)
- [list snapshots](#list-snapshots)
- [mount snapshot](#mount-snapshot)
- [destroy snapshot](#destroy-snapshot)
- [rollback to a snapshot](#rollback-to-a-snapshot)
- [get compression](#get-compression)
- [set compression](#set-compression)
  - [get compression ratio](#get-compression-ratio)
- [send snapshots to other device](#send-snapshots-to-other-device)
- [build zfs raid with ssd cache](#build-zfs-raid-with-ssd-cache)
  - [save disk identifiers mapping](#save-disk-identifiers-mapping)
  - [zfs test redundancy](#zfs-test-redundancy)
- [send snapshot through ssh](#send-snapshot-through-ssh)
- [create zfs encrypted](#create-zfs-encrypted)


## create filesystem

```sh
zpool create NAME DEVICE
```

## create zfs slot

```sh
zfs create NAME/path1/path2
```

## set acl

```sh
zfs set acltype=posix NAME
```

## set mountpoint

```sh
zfs set mountpoint=MOUNTPOINT NAME
```

## take snapshot

```sh
zfs snapshot NAME@TAG
```

## list snapshots

```sh
zfs list -t snapshot
```

## mount snapshot

```sh
mount -t zfs NAME@TAG MOUNTPOINT
```

## destroy snapshot

```sh
zfs destroy NAME@TAG
```

## rollback to a snapshot

```sh
zfs rollback NAME@TAG
```

## get compression

```sh
zfs get compression NAME
```

## set compression

```sh
zfs set compression=on NAME
```

### get compression ratio

```sh
zfs get compressratio
```

## send snapshots to other device

given follow example

```sh
NAME                                       USED  AVAIL  REFER  MOUNTPOINT
bk/test/current@one                         64K      -    96K  -
bk/test/current@two                         56K      -    96K  -
bk/test/current@three                        0B      -   104K  -
```

given a bk2 pool exists

- send initial snapshot

```sh
zfs send bk/test/current@one | zfs recv bk2/test/current
```

- this gives

```sh
NAME                                       USED  AVAIL  REFER  MOUNTPOINT
bk/test/current@one                         64K      -    96K  -
bk/test/current@two                         56K      -    96K  -
bk/test/current@three                        0B      -   104K  -
bk2/test/current@one                        64K      -    96K  -
```

- update bk2 with other bk snapshots ( two, three ) by specifying from latest existing also in bk2 @one toward the latest to send @three

```sh
zfs send -I bk/test/current@one bk/test/current@three | zfs recv bk2/test/current
```

- this gives

```sh
NAME                                       USED  AVAIL  REFER  MOUNTPOINT
bk/test/current@one                         64K      -    96K  -
bk/test/current@two                         56K      -    96K  -
bk/test/current@three                        0B      -   104K  -
bk2/test/current@one                        64K      -    96K  -
bk2/test/current@two                        56K      -    96K  -
bk2/test/current@three                       0B      -   104K  -
```

## build zfs raid with ssd cache

- suppose follow layout
  - `/dev/sdc3` is a 200GB ssd cache disk
  - `/dev/sda`, `/dev/sdb`, `/dev/sdd`, `/dev/sde`, `/dev/sdf` are 4tb disks

```sh
zpool create tank raidz1 sda sdb sdd sde sdf -f
```

- add `/dev/sdc3` as cache

```sh
zpool add tank cache /dev/sdc3  -f
```

- get status

```sh
$ zpool status -v tank
  pool: tank
 state: ONLINE
config:

        NAME        STATE     READ WRITE CKSUM
        tank        ONLINE       0     0     0
          raidz1-0  ONLINE       0     0     0
            sda     ONLINE       0     0     0
            sdb     ONLINE       0     0     0
            sdd     ONLINE       0     0     0
            sde     ONLINE       0     0     0
            sdf     ONLINE       0     0     0
        cache
          sdc3      ONLINE       0     0     0

errors: No known data errors
```

### save disk identifiers mapping

know the serial belonging a device allow you to know which of the disk is to remove and replace when degraded

```sh
lsblk -o PATH,SERIAL
```

### zfs test redundancy

- physical disk removing 1 disk ( or without physical detach can be offlined with `zpool offline POOL DEVICE` )

```sh
$ zpool status
  pool: tank
 state: DEGRADED
status: One or more devices has been removed by the administrator.
        Sufficient replicas exist for the pool to continue functioning in a
        degraded state.
action: Online the device using zpool online' or replace the device with
        'zpool replace'.
config:

        NAME        STATE     READ WRITE CKSUM
        tank        DEGRADED     0     0     0
          raidz1-0  DEGRADED     0     0     0
            sde     ONLINE       0     0     0
            sdf     ONLINE       0     0     0
            sdb     ONLINE       0     0     0
            sdc     ONLINE       0     0     0
            sdd     REMOVED      0     0     0
        cache
          sda3      ONLINE       0     0     0

errors: No known data errors
```

- wipe 1GB of the disk `wipefs -af /dev/DEVICE` ( carefully check which DEVICE is the one to destroy )

- reattach 1 disk ( or without physical action can be onlined with `zpool online POOL DEVICE` )

```sh
zpool replace POOL DEVICEPOOL
```

or if device changed /dev identifier

```sh
zpool replace POOL DEVICEPOOL NEWDEVICEPOOL
```

- now `zpool status`

```sh
  pool: tank
 state: ONLINE
status: One or more devices is currently being resilvered.  The pool will
        continue to function, possibly in a degraded state.
action: Wait for the resilver to complete.
  scan: resilver in progress since Sat Feb  1 13:37:15 2025
        25.4G / 926G scanned, 453M / 926G issued at 64.7M/s
        96.3M resilvered, 0.05% done, 04:04:10 to go
config:

        NAME        STATE     READ WRITE CKSUM
        tank        ONLINE       0     0     0
          raidz1-0  ONLINE       0     0     0
            sde     ONLINE       0     0     0
            sdf     ONLINE       0     0     0
            sdb     ONLINE       0     0     0
            sdc     ONLINE       0     0     0
            sdd     ONLINE       0     0     0  (resilvering)
        cache
          sda3      ONLINE       0     0     0

errors: No known data errors
```

## send snapshot through ssh

- note: `i` instead of `I` parameter ( need to configure `~/.ssh/config` to allow access DESTHOST )

```sh
zfs send -i bk/test/current@one bk/test/current@three | pv | ssh DESTHOST zfs recv bk2/test/current
```

## create zfs encrypted

- given `tank` an existing pool

```sh
zfs create -o encryption=on -o keylocation=prompt -o keyformat=passphrase tank/encrypted
```

- to open the encrypted pool after reboot

```sh
zfs load-key -r tank/encrypted
```

- to mount all datasets
  
```sh
zfs mount -a
```