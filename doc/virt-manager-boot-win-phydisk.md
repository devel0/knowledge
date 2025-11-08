# virt manager boot win phydisk

- create vm
- manual install
- choose os : windows
- set ram
- untick "enable storage"
- tick "customize configuration"
- from the wizard
  - overview / firmware `UEFI x86_64 : /usr/share/OVMF/OVMF_CODE_4M.secboot.fd`
  - tune cpu count
  - from overview / xml under `devices` section ( tune your `source dev` )

```xml
<disk type="block" device="disk">
    <driver name="qemu" type="raw"/>
    <source dev="/dev/sdXXXX"/>
    <target dev="vda" bus="sata"/>
    <address type="drive" controller="0" bus="0" target="0" unit="2"/>
</disk>
```