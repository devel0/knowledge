# virsh

- [ss](#ss)

## remove attached usb devuce from snapshot

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