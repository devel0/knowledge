# virsh

- [ss](#ss)

## save and restore domain with snapshots

- pre: clone [linux-scripts-utils](https://github.com/devel0/linux-scripts-utils/tree/master) adding a path to

- from source machine
  - copy qcow2 files
  - save domain and snaps

```sh
virsh-save-xml VMNAME PATH_TO_SAVEFOLDER
```

- from other machine
  - copy qcow in the same path ( ie `/var/lib/libvirt/images` )
  - restore domain and snaps

```sh
virsh-restore-xml PATH_TO_SAVEFOLDER/VMNAME
```

## remove attached usb device from snapshot

to allow start a snapshot with not available attached usb

```sh
virsh snapshot-edit DOMAINNAME --snapshotname SNAPNAME
```

locate `hostdev` and set startup optional with `<source startupPolicy='optional'>`, example:

```xml
      <hostdev mode='subsystem' type='usb' managed='no'>
        <source startupPolicy='optional'>
          <vendor id='0x13fe'/>
          <product id='0x1f00'/>
        </source>
        <address type='usb' bus='0' port='4'/>
      </hostdev>
```