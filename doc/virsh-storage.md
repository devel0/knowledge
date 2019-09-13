# storage

## convert qcow2 to vdi

*[linux](../README.md#linux)*

```sh
qemu-img convert -f qcow2 input.img -O raw tmp.img
VBoxManage convertfromraw --format VDI tmp.img out.vdi
```

## create qcow2 disk

```
qemu-img create -f qcow2 myimg
```

## resize disk

```sh
qemu-img resize disk.qcow2 +40G
virsh start domainname
virsh blockresize domainname path-to-image newsizeG
```
- reboot virtual machine
