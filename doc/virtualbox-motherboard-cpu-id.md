# virtualbox motherboard cpu id

notes:
- to make `setextradata` changes effective vm must restarted with a vm shutdown
- getextradata don't report value if override not set with setextradata
- setextradata simply set a registry into your .vbox file, this will not imply it will match with your config ( for example the hdd may use piix3ide instead of ahci controller )

## motherboard

### get motherboard id

from host shell

```sh
VBoxManage getextradata VMNAME "VBoxInternal/Devices/pcbios/0/Config/DmiBoardSerial"
```

from guest powershell

```sh
Get-CimInstance Win32_BaseBoard
Get-CimInstance Win32_BaseBoard | Select -ExpandProperty SerialNumber
```

### set motherboard id

```sh
VBoxManage setextradata VMNAME "VBoxInternal/Devices/pcbios/0/Config/DmiBoardSerial" "SERIAL"
```

## processor

### get processor id

from host shell

```sh
VBoxManage getextradata VMNAME "VBoxInternal/Devices/pcbios/0/Config/DmiSystemSerial" 
```

from guest powershell

```sh
wmic bios get serialnumber
```

### set processor id

```sh
VBoxManage setextradata VMNAME "VBoxInternal/Devices/pcbios/0/Config/DmiSystemSerial" "SERIAL"
```

## hard disk

### get hard disk id

from host shell

```sh
VBoxManage getextradata VMNAME "VBoxInternal/Devices/ahci/0/Config/Port0/SerialNumber"
```

from guest powershell

```
wmic diskdrive get serialnumber
```

### set hard disk id

```sh
VBoxManage setextradata VMNAME "VBoxInternal/Devices/ahci/0/Config/Port0/SerialNumber" "SERIAL"
```
