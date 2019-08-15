# id_rsa

*[security](../README.md#security)*

## generate id_rsa keypair

```sh
ssh-keygen -t rsa
```

*note*: enter a different name if don't want overwrite existing one

## remove passphrase

```sh
ssh-keygen -p -f ~/.ssh/id_rsa
```

*note*: insert old password, then hit enter twice to remove

## add passphrase to an id_rsa that was generated without

```sh
ssh-keygen -p -f ~/.ssh/id_rsa
```

## host ECDSA

```sh
ssh-keygen -l -E sha256 -f /etc/ssh/ssh_host_ecdsa_key.pub
```
