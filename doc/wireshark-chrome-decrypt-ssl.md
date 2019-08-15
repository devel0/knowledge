# wireshark chrome decrypt ssl

*[networking](../README.md#networking)*

To decrypt chrome https traffic through wireshark

## set environment variable

```sh
mkdir ~/security
chmod 700 ~/security
export SSLKEYLOGFILE=~/security/sslkeylog.log >> ~/.bashrc
source ~/.bashrc
```

close instances of chrome and restart from same terminal, or restablish session by a logout/login.

## setup wireshark ssl premaster key

- edit / preferences / protocols / ssl / (Pre)-Master-Secret log filename to `~/security/sslkeylog.log`
