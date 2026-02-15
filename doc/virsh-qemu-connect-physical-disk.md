# qemu virsh connect physical disk

just edit the machine xml adding a virtio disk setting your `source` to point the physical disk and using an available `target` one

```xml
<disk type='block' device='disk'>
    <driver name='qemu' type='raw' />
    <source dev='/dev/sdb' />
    <target dev='vdb' bus='virtio' />
</disk>
```
