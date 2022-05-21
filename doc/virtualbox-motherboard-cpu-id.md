# virtualbox motherboard cpu id

preamble: to make `setextradata` changes effective vm must restarted with a vm shutdown

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
