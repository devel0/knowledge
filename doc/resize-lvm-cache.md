# resize lvm cache

<!-- TOC -->
- [resize lvm cache](#resize-lvm-cache)
  * [introduction](#introduction)
  * [turn off swap](#turn-off-swap)
  * [remove cache](#remove-cache)
  * [repartition ssd](#repartition-ssd)
  * [re-enable cache](#re-enable-cache)
  * [enable swap](#enable-swap)
<!-- TOCEND -->

<hr/>

## introduction

suppose
- vg0 : boot uncached volume group
- vg1 : data and backup cache volumes through two ssd partition sda1 (data) and sda2 (backup)
- want to remove swap from swapfile and move to a partition outside lvm cache
- wants to resize backup cache to gain 32GB to enable swapfile on a sda3 ( out of caching )

current status

```sh
root@srv0:/# pvs
  PV         VG  Fmt  Attr PSize    PFree 
  /dev/md0p1 vg0 lvm2 a--     4.65g     0 
  /dev/md0p2 vg1 lvm2 a--    10.91t     0 
  /dev/sda1  vg1 lvm2 a--  <110.00g  9.80g
  /dev/sda2  vg1 lvm2 a--  <110.00g <9.90g

root@srv0:/# vgs
  VG  #PV #LV #SN Attr   VSize   VFree  
  vg0   1   1   0 wz--n-   4.65g      0 
  vg1   3   2   0 wz--n- <11.13t <19.70g

root@srv0:/# lvs
  LV     VG  Attr       LSize  Pool         Origin         Data%  Meta%  Move Log Cpy%Sync Convert
  boot   vg0 -wi-ao----  4.65g                                                                    
  backup vg1 Cwi-aoC--- <5.46t [cachedata2] [backup_corig] 99.99  9.64            79.42           
  data   vg1 Cwi-aoC--- <5.46t [cachedata1] [data_corig]   99.99  9.64            91.85 
```

after changes

```
root@srv0:~# lsblk
NAME                     MAJ:MIN RM   SIZE RO TYPE  MOUNTPOINT
sda                        8:0    0 232.9G  0 disk  
├─sda1                     8:1    0   110G  0 part  
│ ├─vg1-cachedata1_cdata 253:0    0   100G  0 lvm   
│ │ └─vg1-data           253:3    0   5.5T  0 lvm   /
│ └─vg1-cachedata1_cmeta 253:1    0   100M  0 lvm   
│   └─vg1-data           253:3    0   5.5T  0 lvm   /
├─sda2                     8:2    0    80G  0 part  
│ ├─vg1-cachedata2_cdata 253:4    0    70G  0 lvm   
│ │ └─vg1-backup         253:8    0   5.5T  0 lvm   /backup
│ └─vg1-cachedata2_cmeta 253:5    0    80M  0 lvm   
│   └─vg1-backup         253:8    0   5.5T  0 lvm   /backup
└─sda3                     8:3    0    32G  0 part  [SWAP]
```

## turn off swap

note that if swap if actually used a better solution is to reboot the machine and apply swapoff from a just booted up state

```sh
swapoff -a
```

## remove cache

as `lvs` showed cache on backup volume group is called cachedata2 so remove with fully qualified name

```sh
lvremove vg1/cachedata2
```

remove physical volume ssd from vg1, then remove from physical volumes

```
vgreduce vg1 /dev/sda2
pvremove /dev/sda2
```

## repartition ssd

repartition /dev/sda2 (110G) to /dev/sda2 (32G) that will used for swap and /dev/sda3 (90G) that will used

```sh
root@srv0:~# fdisk /dev/sda

Welcome to fdisk (util-linux 2.31.1).
Changes will remain in memory only, until you decide to write them.
Be careful before using the write command.


Command (m for help): p
Disk /dev/sda: 232.9 GiB, 250059350016 bytes, 488397168 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: 09E11E48-0767-46CE-A48B-78AD2242E6DE

Device         Start       End   Sectors  Size Type
/dev/sda1       2048 230688767 230686720  110G Linux filesystem
/dev/sda2  230688768 461375487 230686720  110G Linux filesystem

Command (m for help): d
Partition number (1,2, default 2): 2

Partition 2 has been deleted.

Command (m for help): n
Partition number (2-128, default 2): 
First sector (230688768-488397134, default 230688768): 
Last sector, +sectors or +size{K,M,G,T,P} (230688768-488397134, default 488397134): +80G

Created a new partition 2 of type 'Linux filesystem' and of size 80 GiB.

Command (m for help): n
Partition number (3-128, default 3): 
First sector (398460928-488397134, default 398460928): 
Last sector, +sectors or +size{K,M,G,T,P} (398460928-488397134, default 488397134): +32G

Created a new partition 3 of type 'Linux filesystem' and of size 32 GiB.

Command (m for help): w
The partition table has been altered.
Syncing disks.
Command (m for help): p
Disk /dev/sda: 232.9 GiB, 250059350016 bytes, 488397168 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: 09E11E48-0767-46CE-A48B-78AD2242E6DE

Device         Start       End   Sectors  Size Type
/dev/sda1       2048 230688767 230686720  110G Linux filesystem
/dev/sda2  230688768 398460927 167772160   80G Linux filesystem
/dev/sda3  398460928 465569791  67108864   32G Linux filesystem
```

now `/dev/sda2` will used as cache for backup while `/dev/sda3` will used as swap partition

## re-enable cache

```sh
pvcreate /dev/sda2
vgextend vg1 /dev/sda2
lvcreate -L 70M -n cachemeta2 vg1 /dev/sda2
lvcreate -L 70G -n cachedata2 vg1 /dev/sda2
lvconvert --type cache-pool --poolmetadata vg1/cachemeta2 --cachemode writeback vg1/cachedata2 --yes
lvconvert --type cache --cachepool vg1/cachedata2 vg1/backup
```

## enable swap

```sh
dd if=/dev/zero of=/dev/sda3 bs=1k
mkswap /dev/sda3
```

note: initialization can take a while ( an ssd at 1k block write can reach about 60mb/s )

update fstab
```
/dev/sda3       none            swap    sw              0       0
```

turn swap on
```
swapon -a
free -h
```
