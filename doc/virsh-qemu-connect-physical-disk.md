# qemu virsh connect physical disk

- create vm
- manual install
- os: ubuntu 24.04 lts
- ram 8192m ; 4 cpu
- untick "enable storage"
- name of vm ; check "customize"
- finish
- firmware : `OVMF_CODE_4M.ms.fd` ; apply
- add controller : SCSI - VirtIO SCSI
- add storage / xml

just edit the machine xml adding a virtio disk setting your `source` to point the physical disk

```xml
<disk type='block' device='disk'>
    <driver name='qemu' type='raw' />
    <source dev='/dev/sdb' />
    <target dev='vdb' bus='virtio' />
</disk>
```

- start / enter EFI boot manager and add device with path to

`EFI/ubuntu/shimx64.efi`

set a input description name

- commit changes and exit
