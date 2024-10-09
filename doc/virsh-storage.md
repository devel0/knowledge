# storage

<!-- TOC -->
- [convert qcow2 to vdi](#convert-qcow2-to-vdi)
- [create qcow2 disk](#create-qcow2-disk)
- [resize disk](#resize-disk)
- [remove reserved partition](#remove-reserved-partition)
- [rsync qemu img](#rsync-qemu-img)
<!-- TOCEND -->

<hr/>

## convert qcow2 to vdi

```sh
qemu-img convert -f qcow2 input.img -O raw tmp.img
VBoxManage convertfromraw --format VDI tmp.img out.vdi
```

## create qcow2 disk

```sh
qemu-img create -f qcow2 myimg
```

## resize disk

```sh
qemu-img resize disk.qcow2 +40G
```

if guest doesn't show physical disk with new size try follows

```sh
virsh start domainname
virsh blockresize domainname path-to-image newsizeG
```
- reboot virtual machine

## remove reserved partition

to remove reserved partition on windows system to allow disk expand there is the need to use diskpart, eg

```sh
list disk
select disk 0 <--- check your own
list partition
select partition 3 <--- check your own
delete partition override
```

## rsync qemu img

- use `--sparse --inplace -z` options to save bandwidth when transferring qemu virtual images that have smaller effective disk image size ( see `qemu-img info file.qcow2` to show virtual and disk size of the image )