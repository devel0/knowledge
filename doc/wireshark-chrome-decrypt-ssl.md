# wireshark chrome decrypt ssl

To decrypt chrome https traffic through wireshark

## set environment variable

```sh
mkdir ~/security
chmod 700 ~/security
echo export SSLKEYLOGFILE=~/security/sslkeylog.log >> ~/.bashrc
source ~/.bashrc
```

close instances of chrome and restart from same terminal, or restablish session by a logout/login.

## setup wireshark ssl premaster key

- edit / preferences / protocols / ssl or tls / (Pre)-Master-Secret log filename to `~/security/sslkeylog.log`

## record key for a dotnet app

edit the `someapp.runtimeconfig.json` setting

```json
{
    "runtimeOptions": {
        "configProperties": {
            "System.Net.EnableSslKeyLogging": true
        }
    }
}
```

- reference : https://devblogs.microsoft.com/dotnet/dotnet-9-networking-improvements/