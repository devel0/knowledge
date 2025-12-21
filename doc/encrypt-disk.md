# encrypt disk

<!-- TOC -->
- [initialize partition crypto luks mapping](#initialize-partition-crypto-luks-mapping)
- [open disk](#open-disk)
- [use keyfile for automount](#use-keyfile-for-automount)
- [mount on demand using keyfile and crypttab info](#mount-on-demand-using-keyfile-and-crypttab-info)
- [duplicated uuid](#duplicated-uuid)
- [change lvm encrypted passphrase](#change-lvm-encrypted-passphrase)
- [autodecrypt using TPM2](#autodecrypt-using-tpm2)
  - [prevent kernel update deconfigure clevis luks](#prevent-kernel-update-deconfigure-clevis-luks)
  - [list clevis tpm2 config](#list-clevis-tpm2-config)
  - [regen clevis tpm2 config](#regen-clevis-tpm2-config)
  - [cheatsheet](#cheatsheet)
- [decrypt using pendrive](#decrypt-using-pendrive)
  - [avoid dependency job-dev-by boot slow down when keydrive not avail](#avoid-dependency-job-dev-by-boot-slow-down-when-keydrive-not-avail)
<!-- TOCEND -->

## initialize partition crypto luks mapping

```sh
cryptsetup -v -y luksFormat /dev/sdX1
cryptsetup luksOpen /dev/sdX1 mydrive
mkfs.my /dev/mapper/mydrive
```

## open disk

```sh
cryptsetup luksOpen /dev/sdX1 mydrive
mount /dev/mapper/mydrive /fld
```

## use keyfile for automount

suppose `/root` resides on a full encrypted system; you can place some key for automount of other encrypted devices ( `disk_4tb` attached on boot while `disk_4tb_bk` attached on demand )

- create keyfile ( may useful to install `haveged` to increase random entropy )

```sh
dd bs=512 count=4 if=/dev/random of=/root/.disk-4tb.key iflag=fullblock
dd bs=512 count=4 if=/dev/random of=/root/.disk-4tb-bk.key iflag=fullblock
chmod 400 /root/.disk-4tb*key
```

- add keys disks ( luksOpen required; double check device correspondence using `blkid` )

```sh
cryptsetup luksAddKey /dev/sda1 /root/.disk-4tb.key
cryptsetup luksAddKey /dev/sdc1 /root/.disk-4tb-bk.key
```

- setup `/etc/crypttab`

```
disk_4tb UUID=xxxxxxxx-yyyy-zzzz-wwww-aaaaaaaaaaaa /root/.disk-4tb.key luks
disk_4tb_bk UUID=xxxxxxxx-yyyy-zzzz-wwww-aaaaaaaaaaa2 /root/.disk-4tb-bk.key luks,noauto
```

- setup `/etc/fstab`

```
/dev/mapper/disk_4tb	/disk-4tb	btrfs defaults 0 2
/dev/mapper/disk_4tb_bk	/disk-4tb-bk	btrfs	defaults,noauto 0 2
```

## mount on demand using keyfile and crypttab info

```sh
cryptdisks_start disk_4tb_bk
mount /disk-4tb-bk
```

## duplicated uuid

typical scenario:
- have two backup disks ( short and long term )
- do not mount these at the same time
- want to mount one of backup disk in a specific folder through /etc/crypttab and /etc/fstab

```sh
cryptsetup luksUUID /dev/sdX1 --uuid "xxxxxxxx-yyyy-zzzz-wwww-aaaaaaaaaaaa"
```

## change lvm encrypted passphrase

- install gnome disks `apt-get install gnome-disk-utility`
- start `gnome-disks`
- choose luks partition then click on *gear* icon and select *Change passphrase*

## autodecrypt using TPM2

- install distro using lvm-encrypted with a passphrase
- after first boot using passphrase from keyboard, from terminal:

Note: replace DEVICE with the one within crypto `blkid | grep crypto`

```sh
apt-get install clevis clevis-tpm2 clevis-luks clevis-initramfs initramfs-tools
clevis luks bind -d DEVICE tpm2 '{"pcr_bank":"sha256","pcr_ids":"8"}'
update-initramfs -u -k all
```

:warning: use at least pcr bank 8 to prevent init=/bin/sh linux kernel boot override ( see `man systemd-cryptenroll` )

### prevent kernel update deconfigure clevis luks

In order to prevent auto-decryption stop working after kernel update create the script in `/etc/kernel/postinst.d/zz-zclevis` with follow content

```sh
#!/bin/bash

DEVICE=/dev/sda3    # REPLACE DEVICE with your own
SLOT=2              # REAPLCE SLOT with your (see clevis luks list...)

clevis luks regen -d $DEVICE -s $SLOT -q
```

then `chmod +x /etc/kernel/postinst.d/zz-zclevis`

To test you can reconfigure actual kernel with `dpkg-reconfigure linux-image-$(uname -r)` ;

You can test that without the above `zz-zclevis` post-kernel-update script the drive autounlock it wouldn't have worked and at the boot the prompt for the password would have remained still.

### list clevis tpm2 config

```sh
clevis luks list -d DEV
```

### regen clevis tpm2 config

( replace SLOT with the one matching from the `clevis luks list -d DEV` cmd )

```sh
clevis luks regen -d DEV -s SLOT -q
```

### cheatsheet

| cmd                                               | description                               |
| ------------------------------------------------- | ----------------------------------------- |
| `cryptsetup --verbose open --test-passphrase DEV` | test device for unlock w/given passphrase |
| `cryptsetup luksDump DEV`                         | list slots                                |
| `cryptsetup luksChangeKey DEV -S SLOTNR`          | change slot password                      |
| `cryptsetup luksAddKey DEV`                       | add password to slot                      |
| `cryptsetup luksAddKey DEV path-to-keyfile`       | add file as keyfile to slot               |
| `cryptsetup -v luksKillSlot DEV SLOTNR`           | remove slot                               |
| `cryptsetup token remove --token-id TOKENID DEV`  | remove token                              |
| `tpm2_pcrread`                                    | read tpm2 pcr banks                       |

## decrypt using pendrive

- generate a key ( in a safe place, ie in `/root` in an already full encrypted system )

```sh
dd if=/dev/urandom bs=1 count=256 > passphrase
```

- put the key to the drive ; in order to have a unique identifier you need to fdisk and create at least one partition, then view the disk through `fdisk -l` to see which is the Start sector of the partition you use to store the key in

in example
```sh
~# fdisk -l /dev/vdb
Disk /dev/vdb: 1,02 MiB, 1074176 bytes, 2098 sectors
Units: sectors of 1 * 512 = 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: dos
Disk identifier: 0x2eb5b71a

Device     Boot Start   End Sectors Size Id Type
/dev/vdb1           1  2097    2097   1M 83 Linux
```

then use option `seek=XXX` replacing XXX with start sector 

```sh
# change seek=0 to somewhere else if in a real pendrive
dd if=passphrase of=$KEYDEV bs=1 seek=1
```

- add key to unlock disk

```sh
cryptsetup luksAddKey $ENCDEV passphrase
```

- delete passphrase file

```sh
rm passphrase
```

- find a unique definition for the device by looking at `/dev/disk`

```sh
ls -la /dev/disk/by-partuuid
```

- edit `/etc/crypttab` like follow

```
luks-xxxxxxxxxxxx UUID=xxxxxxxxxxxx /dev/disk/by-partuuid/yyyyyyyy luks,keyscript=/bin/key-from-drive
```

where
- xxxxxxxxxxxx is the uuid of the encrypted disk
- yyyyyyyy is the partition uuid of the keydrive

- edit `/bin/key-from-drive`

```sh
#!/bin/sh

set -e

if [ ! -e /keydrive-tried ]; then
        touch /keydrive-tried
        if [ -e "$CRYPTTAB_KEY" ]; then
                dd if="$CRYPTTAB_KEY" bs=1 skip=1 count=256 2>/dev/null
                exit
        fi
fi

/lib/cryptsetup/askpass "Tried with $CRYPTTAB_KEY failed. Unlock the disk $CRYPTTAB_SOURCE ($CRYPTTAB_NAME), enter passphrase: "
```

- edit `/etc/initramfs-tools/hooks/key-from-drive`

```sh
#!/bin/sh

PREREQ=""

prereqs() {
        echo "$PREREQ"
}

case "$1" in
         prereqs)
                 prereqs
                 exit 0
         ;;
esac

. "${CONFDIR}/initramfs.conf"
. /usr/share/initramfs-tools/hook-functions

copy_exec /bin/key-from-drive /bin
```

- issue `update-initramfs -u` then `update-grub`

- references: https://stackoverflow.com/a/19713920/5521766

### avoid dependency job-dev-by boot slow down when keydrive not avail

unfortunately when there is no keydrive, and you enter the password through keyboard the boot still slowdown by the systemd-cryptsetup dependency that still try to search for not existant device you mentioned in the `crypttab`

to solve you can set the password device to `none` in crypttab and set statically in the `/bin/key-from-drive`

so that `/etc/crypttab` changes to

```
luks-xxxxxxxxxxxx UUID=xxxxxxxxxxxx none luks,keyscript=/bin/key-from-drive
```

while `/bin/key-from-drive` changes


```sh
#!/bin/sh

CRYPTTAB_KEY=/dev/disk/by-partuuid/yyyyyyyy

set -e

...
```

