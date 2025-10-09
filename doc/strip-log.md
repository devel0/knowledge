# strip log

- [systemd journal](#systemd-journal)
- [rsyslog](#rsyslog)
  - [how to](#how-to)
  - [strip messages by program name](#strip-messages-by-program-name)
  - [strip messages by message content](#strip-messages-by-message-content)
  - [reference](#reference)

## systemd journal

given a service name, edit `/etc/systemd/system/unit-name.service`

```conf
[Service]
LogFilterPatterns=~pattern-to-exclude
```

this will exclude messages containing "pattern-to-exclude" related to the `unit-name` service.

after editing .service file issue `systemctl daemon-reload`

## rsyslog

### how to

- edit `/etc/rsyslog.d/50-default.conf` inserting commands ( see below )
- `service rsyslog restart`

### strip messages by program name

Example: strip from log all messages that cames from "gnome-shell" program

```
:programname, contains, "gnome-shell" ~
```

### strip messages by message content

```
:msg, contains, "somemessage" ~
```

### reference

- [rsyslog.conf](http://manpages.ubuntu.com/manpages/bionic/en/man5/rsyslog.conf.5.html)
