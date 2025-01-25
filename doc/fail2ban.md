# fail2ban

## quickstart

```sh
apt install fail2ban
```

## get status

```sh
fail2ban-client status
```

## get status by service

```sh
fail2ban-client status SERVICE
```

## get list of banned ips

```sh
fail2ban-client get SERVICE banned
```

## enable a service jail

- edit the file in `jail.d` and insert some service ( list in `/etc/fail2ban/jail.conf` ), ie

```conf
[apache-auth]
enabled = true
```
