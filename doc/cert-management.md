# cert management

## show cert info

```sh
openssl x509 -in certfilename -text
```

## import cert as trusted

- chrome : click on cert / details / export

- install `certutil`

```sh
apt install libnss3-tools
```

- install certificate ( note that ~/.pki may not exists and it will created )

```sh
certutil -d sql:$HOME/.pki/nssdb -A -t "CP,CP," -n certAlias -i certFile.crt
```

- restart chrome
