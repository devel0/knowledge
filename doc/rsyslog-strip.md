# rsyslog strip

*linux*

## how to

- edit `/etc/rsyslog.d/50-default.conf
- `service rsyslog restart`

## strip messages by program name

Example: strip from log all messages that came from "gnome-shell" program

```
:programname, contains, "gnome-shell" ~
```

## strip messages by message content

```
:msg, contains, "somemessage" ~
```

## reference

- [rsyslog.conf](http://manpages.ubuntu.com/manpages/bionic/en/man5/rsyslog.conf.5.html)
