# quick and dirty server install notes

<!-- TOC -->
* [prerequisites](#prerequisites)
* [supposed hardware and os](#supposed-hardware-and-os)
* [storage arrangement](#storage-arrangement)
* [bootstrap and partitioning](#bootstrap-and-partitioning)
* [setup kernel parameters](#setup-kernel-parameters)
* [ensure grub installed on all raid disks](#ensure-grub-installed-on-all-raid-disks)
* [setup network and base system](#setup-network-and-base-system)
* [enable ssd cache](#enable-ssd-cache)
* [replace damaged disk](#replace-damaged-disk)
* [disks layout](#disks-layout)
* [software install](#software-install)
* [create docker networks](#create-docker-networks)
* [firewall](#firewall)
<!-- TOCEND -->

<hr/>

## prerequisites

- [linux scripts](https://github.com/devel0/linux-scripts-utils)

## supposed hardware and os

- 5 x 4TB disk + 1 x 250GB SSD (cache)
- OS : Ubuntu 16.04.3 LTS

```
root@nas:/scripts# lsb_release -a
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 16.04.3 LTS
Release:        16.04
Codename:       xenial
```

## storage arrangement

- RAID6 ( 2 disk redudant )
  - **md0p1** ( 4.7G /boot to manage kernel startup and lvm cache module load )
  - **md0p2** ( 10.9T / for operating system, data, backup )
- VOLUME GROUPS
  - **vg0** ( contains first primary raid partition and inside there is lv **boot** ext4 formatted without cache )
  - **vg1** ( contains second raid partition with inside lv **data** (ext4) and **backup** (btrfs) each 5.6T with cache enable )
- CACHE ( with two partition 110G to cache data and backup disks )

## bootstrap and partitioning

- normal install boot : create on each raid disk an initial partition of 1MB for boot
- install rescue with raid autodetect : use parted `mklabel gpt` to set partition /dev/md0 or /dev/md127
  - on raid disk create a partition of 5GB for /boot
  - the rest for data+backup
  - set partitions to type 30 ( Linux LVM )
- normal install : during installation use `echo 0 > /proc/sys/dev/raid/speed_limit_max` to speedup installation

## setup kernel parameters

- for a safer disk operation its suggested to disable NCQ editing `/etc/default/grub` as follow

```
GRUB_CMDLINE_LINUX="vga=0 libata.force=noncq cgroup_enable=memory swapaccount=1 amd_iommu=on iommu=pt"
```

- then update grub using `update-grub`

## ensure grub installed on all raid disks

```
for i in b c d e f; do grub-install /dev/sd$i; done
```

## setup network and base system

```
apt-get update
apt-get upgrade
apt-get install -y network-manager smartmontools cifs-utils iotop bc curl gdisk libelf-dev build-essential git bmon

touch /etc/NetworkManager/conf.d/10-globally-managed-devices.conf
```

- comment out enp3s0 from `/etc/network/interfaces`
- configure enp3s0 wired connection through `nmtui` as follow ( note : during install use 8.8.8.8 dns )
  - ip: 192.168.0.220/24
  - gw: 192.168.0.1
  - dns: 172.18.0.2
  - search: example.com

- ensure `enp3s0` interface name stability through udev rule
  - create `/itadmin/config/udev-rules` as follow ( tune mac address )
  
```
SUBSYSTEM=="net", ATTR{address}=="11:22:33:44:55:66", NAME="enp3s0"
```
  - link by `ln -s ../../../it-admin/config/udev-rules /etc/udev/rules.d/99-custom-udev.rules`
  
- disable smartmon

```
systemctl disable smartd
systemctl mask smartmontools
```

- raid default reconstruction max speed and inotify

create `/it-admin/config/sysctl` as follow
```
dev.raid.speed_limit_min = 10000
dev.raid.speed_limit_max = 30000
fs.inotify.max_user_watches = 1048576
```

```
ln -s ../../it-admin/config/sysctl /etc/sysctl.d/99-custom.conf
```

- environment paths, edit `/etc/environment` as follow

```
PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/scripts"
LC_ALL="en_US.UTF-8"
```

- set disk autofix editing `/etc/default/rcS` as follow

```
FSCKFIX=yes
```

## enable ssd cache

note : execute follow procedure until last without reboot

- data cache

```
pvcreate /dev/sda1
vgextend vg1 /dev/sda1
lvcreate -L 100M -n cachemeta1 vg1 /dev/sda1
lvcreate -L 100G -n cachedata1 vg1 /dev/sda1
lvconvert --type cache-pool --poolmetadata vg1/cachemeta1 --cachemode writeback vg1/cachedata1 --yes
lvconvert --type cache --cachepool vg1/cachedata1 vg1/data
```

- backup cache

```
pvcreate /dev/sda2
vgextend vg1 /dev/sda2
lvcreate -L 100M -n cachemeta2 vg1 /dev/sda2
lvcreate -L 100G -n cachedata2 vg1 /dev/sda2
lvconvert --type cache-pool --poolmetadata vg1/cachemeta2 --cachemode writeback vg1/cachedata2 --yes
lvconvert --type cache --cachepool vg1/cachedata2 vg1/backup
```

- install thin provisioning ( to allow boot cached root partition )

```
apt-get install -y thin-provisioning-tools
```

```
HOOK=$(tempfile)
# Add a hook script to initramfs to add the right tools and modules
cat <<'EOF' > $HOOK
#!/bin/sh
PREREQ="lvm2"
prereqs()
{
  echo "$PREREQ"
}
case $1 in
prereqs)
  prereqs
  exit 0
  ;;
esac
if [ ! -x /usr/sbin/cache_check ]; then
  exit 0
fi
. /usr/share/initramfs-tools/hook-functions
copy_exec /usr/sbin/cache_check
manual_add_modules dm_cache dm_cache_mq dm_cache_smq dm_persistent_data dm_bufio
EOF

cp $HOOK /etc/initramfs-tools/hooks/lvmcache
chmod +x /etc/initramfs-tools/hooks/lvmcache

echo "dm_cache" >> /etc/initramfs-tools/modules
echo "dm_cache_mq" >> /etc/initramfs-tools/modules
echo "dm_cache_smq" >> /etc/initramfs-tools/modules
echo "dm_persistent_data" >> /etc/initramfs-tools/modules
echo "dm_bufio" >> /etc/initramfs-tools/modules
```

- update initramfs `update-initramfs -u`

- now system can rebooted and boot from raid autoenabling data+backup cache from /boot partition kernel modules

## replace cache disk

replace of cache disk is suggested when TBw exceed certified max TBw of the ssd disk ( see [here](https://github.com/devel0/knowledge/blob/c09e48fea493d7092b8146ae0f7a88586f53aed0/doc/ssd-wear.md#L29) to guess actual value ).

in order to replace cache disk, current cache has to be removed:

```sh
lvconvert --uncache vg1/data
vgreduce vg1 /dev/sda1
pvs remove /dev/sda1

lvconvert --uncache vg1/backup
vgreduce vg1 /dev/sda2
pvs remove /dev/sda2
```

- now turn off system and replace disk
- after boot up redo [enable ssd cache](#enable-ssd-cache)

## replace damaged disk

- [see this](replace-raid-md-damaged-disk.md)

## disks layout

```
**fdisk -l**

root@srv0:~# fdisk -l
Disk /dev/sda: 232.9 GiB, 250059350016 bytes, 488397168 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x11223344

Device     Boot     Start       End   Sectors  Size Id Type
/dev/sda1            2048 230688767 230686720  110G 83 Linux
/dev/sda2       230688768 461375487 230686720  110G 83 Linux


Disk /dev/sdb: 3.7 TiB, 4000787030016 bytes, 7814037168 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes
Disklabel type: gpt
Disk identifier: 11223344-1122-1122-1122-112233445566

Device     Start        End    Sectors  Size Type
/dev/sdb1   2048       4095       2048    1M BIOS boot
/dev/sdb2   4096 7814035455 7814031360  3.7T Linux RAID


Disk /dev/sdc: 3.7 TiB, 4000787030016 bytes, 7814037168 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes
Disklabel type: gpt
Disk identifier: 21223344-1122-1122-1122-112233445566

Device     Start        End    Sectors  Size Type
/dev/sdc1   2048       4095       2048    1M BIOS boot
/dev/sdc2   4096 7814035455 7814031360  3.7T Linux RAID


Disk /dev/sde: 3.7 TiB, 4000787030016 bytes, 7814037168 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes
Disklabel type: gpt
Disk identifier: 31223344-1122-1122-1122-112233445566

Device     Start        End    Sectors  Size Type
/dev/sde1   2048       4095       2048    1M BIOS boot
/dev/sde2   4096 7814035455 7814031360  3.7T Linux RAID


Disk /dev/sdf: 3.7 TiB, 4000787030016 bytes, 7814037168 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes
Disklabel type: gpt
Disk identifier: 41223344-1122-1122-1122-112233445566

Device     Start        End    Sectors  Size Type
/dev/sdf1   2048       4095       2048    1M BIOS boot
/dev/sdf2   4096 7814035455 7814031360  3.7T Linux RAID


Disk /dev/sdd: 3.7 TiB, 4000787030016 bytes, 7814037168 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 4096 bytes / 4096 bytes
Disklabel type: gpt
Disk identifier: 51223344-1122-1122-1122-112233445566

Device     Start        End    Sectors  Size Type
/dev/sdd1   2048       4095       2048    1M BIOS boot
/dev/sdd2   4096 7814035455 7814031360  3.7T Linux RAID


Disk /dev/md0: 10.9 TiB, 12001949515776 bytes, 23441307648 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 524288 bytes / 1572864 bytes
Disklabel type: gpt
Disk identifier: 61223344-1122-1122-1122-112233445566

Device       Start         End     Sectors  Size Type
/dev/md0p1    3072     9768959     9765888  4.7G Linux LVM
/dev/md0p2 9768960 23441307614 23431538655 10.9T Linux LVM


Disk /dev/mapper/vg1-data: 5.5 TiB, 5998475476992 bytes, 11715772416 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 524288 bytes / 1572864 bytes


Disk /dev/mapper/vg0-boot: 4.7 GiB, 4995416064 bytes, 9756672 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 524288 bytes / 1572864 bytes


Disk /dev/mapper/vg1-backup: 5.5 TiB, 5998467088384 bytes, 11715756032 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 4096 bytes
I/O size (minimum/optimal): 524288 bytes / 1572864 bytes
```

**lvm**

```
root@srv0:~# pvs -a
  PV              VG   Fmt  Attr PSize   PFree
  /dev/md0p1      vg0  lvm2 a--    4.65g    0 
  /dev/md0p2      vg1  lvm2 a--   10.91t    0 
  /dev/sda1       vg1  lvm2 a--  110.00g 9.80g
  /dev/sda2       vg1  lvm2 a--  110.00g 9.90g
  /dev/vg0/boot             ---       0     0 
  /dev/vg1/backup           ---       0     0 
  /dev/vg1/data             ---       0     0 
root@srv0:~# vgs -a
  VG   #PV #LV #SN Attr   VSize  VFree 
  vg0    1   1   0 wz--n-  4.65g     0 
  vg1    3   2   0 wz--n- 11.13t 19.70g
root@srv0:~# lvs -a
  LV                 VG   Attr       LSize   Pool         Origin         Data%  Meta%  Move Log Cpy%Sync Convert
  boot               vg0  -wi-ao----   4.65g                                                                    
  backup             vg1  Cwi-aoC---   5.46t [cachedata2] [backup_corig] 100.00 19.04           0.00            
  [backup_corig]     vg1  owi-aoC---   5.46t                                                                    
  [cachedata1]       vg1  Cwi---C--- 100.00g                             100.00 12.70           0.00            
  [cachedata1_cdata] vg1  Cwi-ao---- 100.00g                                                                    
  [cachedata1_cmeta] vg1  ewi-ao---- 100.00m                                                                    
  [cachedata2]       vg1  Cwi---C--- 100.00g                             100.00 19.04           0.00            
  [cachedata2_cdata] vg1  Cwi-ao---- 100.00g                                                                    
  [cachedata2_cmeta] vg1  ewi-ao---- 100.00m                                                                    
  data               vg1  Cwi-aoC---   5.46t [cachedata1] [data_corig]   100.00 12.70           0.00            
  [data_corig]       vg1  owi-aoC---   5.46t                                                                    
  [lvol0_pmspare]    vg1  ewi------- 100.00m                      
```

## software install

- [nodejs](https://nodejs.org/en/download/package-manager/#debian-and-ubuntu-based-linux-distributions)
- [docker](https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/)
  - then disable iptables from `/lib/systemd/system/docker.service`
  - install docker top
```
sudo wget https://github.com/bcicen/ctop/releases/download/v0.7/ctop-0.7-linux-amd64 -O /usr/local/bin/ctop
sudo chmod +x /usr/local/bin/ctop
```
## create docker networks
```
docker network create --subnet=SUBNET NAME
```

SUBNETs and NAMEs follows

```
172.18.0.0/30	dns
172.18.0.4/30   sec
172.19.0.0/30	nginx
172.19.0.4/30	doc
172.19.0.8/30	dc01
172.19.0.16/30	cloud_psql
172.19.0.20/30	cloud
172.19.0.24/30	zimbra
172.19.0.30/30	cloud_sync
172.20.0.0/16	build
```

## firewall

enable firewall by creating `/lib/systemd/system/fw.service` as follow
```
[Unit]
Description=Firewall rules
Requires=docker.service
After=docker.service

[Service]
ExecStart=/scripts/fwapply
Type=oneshot

[Install]
WantedBy=multi-user.target
```
and enabling through `systemctl enable fw`
