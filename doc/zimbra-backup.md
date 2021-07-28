# zimbra backup

from zimbra container prepare a folder

```sh
mkdir /backup
chmod 700 /backup
chown zimbra.zimbra /backup
```

then switch to *zimbra* user

```sh
su - zimbra
```

## backup mailbox

```sh
zmmailbox -z -v -m user@domain getRestURL "//?fmt=tgz" > /backup/user.tgz
```

### backup specific date

- see options query of zmmailbox getRestURL, for example

```sh
zmmailbox -z -v -m user@domain getRestURL --startTime 'YYYY/MM/DD' '//?fmt=tgz' > /backup/user.tgz
```

- if running a parallel backuped zimbra container be aware to override DNS info through /etc/hosts with ip of container i.e. ( replace mailname.fqdn with your  and ip with container ip )

```
172.17.0.2 mailname.fqdn
```

and use `-u "https://IPADDR"` argument on zmmailbox to specify url replacing IPADDR with the one of container

## restore mailbox

```sh
zmmailbox -z -v -m user@domain postRestURL "//?fmt=tgz" /backup/user.tgz
```

## troubleshoot

`connection refused` : it may happen if you ran from a parallel backup container then need to run

```sh
zmmcontrol start
```

note: may need to press ctrl+c on ldap starting to bypass

## reference

- [zmmailbox](https://wiki.zimbra.com/wiki/Zmmailbox)
- [zmmailbox date ranges](https://imanudin.net/2015/01/24/zimbra-tips-how-to-backup-mailbox-daily-weekly-and-monthly/)
