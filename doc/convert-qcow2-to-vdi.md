# convert qcow2 to vdi

*linux*

```
qemu-img convert -f qcow2 input.img -O raw tmp.img
VBoxManage convertfromraw --format VDI tmp.img out.vdi
```
