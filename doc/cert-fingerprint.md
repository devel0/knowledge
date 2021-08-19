# cert fingerprint

- retrieve certificate from site

```sh
openssl s_client -connect website.com:443
```

- then copy cert from begin to end of certificate part and save into a file `cert.pem`

- generate SHA1 fingerprint

```sh
openssl x509 -noout -in ./cert.pem -fingerprint -sha1
```
