# mobile server

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

- need a local web server, it may nginx, with a wwwroot accessible where to create subfolders and files as required from letsencrypt manual certificate challenge verify procedure
- issue `letsencrypt certonly --manual --standalone -d my.com -d app1.my.com -d app2.my.com` for your domain ; during procedure it will ask you more times to create a file in a specific subfolder of wwwroot of serving webserver to complete challenge
- configure your nginx server to user letsencrypt certificates

## opportunity and security considerations

someone will ask himself if having an online server isn't already enough to serve required service, the answer is yes, but, if you paranoid you want data flows through an https encryption to/from your **local** disk with a certificate which private key is in your **local** server, thus the above procedure.
