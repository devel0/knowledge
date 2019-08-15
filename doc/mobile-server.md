# mobile server

*[networking](../README.md#networking)*

## introduction

mobile internet connection doesn't allow INPUT connection due the fact your public ip is shared with other and all outgoing traffic is natted by the provider.
sometimes may happen you have only a mobile connection and need to serve an http, https service directly from your computer.
there are two problems:
- have a INPUT connection
- sign your letsencrypt https certificate

all of these solve by buying a basic online server, personally I found comfortable with [DigitalOcean](https://www.digitalocean.com/) droplets ones: for a 1cpu, 25GB ssd disk ( montly cost equiparable to have 1 static ip address from service provider )

## enable INPUT connections

- on the online server set `sshd_config`
  - to allow `GatewayPorts yes` to allow bind of non-local addresses through reverse ssh
  - to maintain ssh keep alive `ClientAliveInterval 120` and `ClientAliveCountMax 252800` ( 365 days )
  - then restart ssh sevice
- connects through ssh tunnel your 80,443 services
  - `ssh -R 80:10.10.0.18:80 -R 443:10.10.0.18:443 online`
  - where 10.10.0.18 for example is your local nginx server and `online` is the name of your online server configured into `~/.ssh/config`
  
## sign letsencrypt https certificate

- connects the online server so that local 80,443 ports exports there to allow letsencrypt validate certs

```
ssh -R 80:127.0.0.1:80 -R 443:127.0.0.1:443 online
```

- renew certs as [usual](https://github.com/devel0/linux-scripts-utils/blob/d3b7a5e17cb16de982cd260f378ed95cef7b5f47/renew-certs.sh#L15-L25)

## opportunity and security considerations

someone will ask himself if having an online server isn't already enough to serve required service creating an https certs from there, the answer is yes, but, if paranoid you want data flows through an https encryption to/from your **local** disk with a certificate which private key is in your **local** server, thus the above procedure.
