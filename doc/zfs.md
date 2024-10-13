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
