# fail2ban

- [quickstart](#quickstart)
- [get status](#get-status)
- [get status by service](#get-status-by-service)
- [get list of banned ips](#get-list-of-banned-ips)
- [enable a service jail](#enable-a-service-jail)
- [verify maxretry unit](#verify-maxretry-unit)
- [verify regex](#verify-regex)
- [whitelist](#whitelist)
- [ban ssh through iptables](#ban-ssh-through-iptables)

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

## verify maxretry unit

```sh
fail2ban-client --str2sec 1m
```

gives 60 ( sec ) for the input `1m`

## verify regex

```sh
fail2ban-regex /var/log/auth.log sshd
```

## whitelist

in the following example the ip `10.10.1.33` is whitelisted

```conf
[DEFAULT]
ignoreip = 127.0.0.1/8 ::1 10.10.1.33/32
```

## ban ssh through iptables

in the file in the `jail.d` folder

```conf
[sshd]
enabled = true
action = iptables[name=SSH, port=ssh, protocol=tcp]
```