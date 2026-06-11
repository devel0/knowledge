# netplan

## dhcp config

```yaml
network:
    ethernets:
        eno1:
            optional: true
            dhcp4: true        
    version: 2
```

## static config

```yaml
network:
    ethernets:
        eno1:
            optional: true
            dhcp4: false
            addresses: [172.10.0.3/29]
            nameservers:
                addresses: [8.8.8.8, 8.8.4.4]
            routes:
            - to: default
              via: 172.10.0.1
    version: 2
```

## references

- [netplan yaml syntax](https://netplan.readthedocs.io/en/latest/netplan-yaml/)
