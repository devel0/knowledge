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
zmmailbox -z -v -m user@domain getRestURL '//?fmt=tgz&query=after:"mm/dd/yyyy"' > /backup/user.tgz
```

## restore mailbox

```sh
zmmailbox -z -v -m user@domain postRestURL "//?fmt=tgz" /backup/user.tgz
```

## troubleshoot

`connection refused` : it may happen if you ran from a parallel backup container then need to run

```sh
zmmcontrol start mailbox
```

## reference

- [zmmailbox](https://wiki.zimbra.com/wiki/Zmmailbox)
- [zmmailbox date ranges](https://imanudin.net/2015/01/24/zimbra-tips-how-to-backup-mailbox-daily-weekly-and-monthly/)
