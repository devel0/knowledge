# rsyslog strip

*[linux](../README.md#linux)*

## how to

- edit `/etc/rsyslog.d/50-default.conf` inserting commands ( see below )
- `service rsyslog restart`

## strip messages by program name

Example: strip from log all messages that cames from "gnome-shell" program

```
:programname, contains, "gnome-shell" ~
```

## strip messages by message content

```
:msg, contains, "somemessage" ~
```

## reference

- [rsyslog.conf](http://manpages.ubuntu.com/manpages/bionic/en/man5/rsyslog.conf.5.html)
- [Setup a Filter to Discard or Redirect Messages](https://www.thegeekdiary.com/etc-rsyslog-conf-setup-a-filter-to-discard-or-redirect-messages/)
