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
