# id_rsa

*sysadmin*

## generate id_rsa keypair

```
ssh-keygen -t rsa
```

*note*: enter a different name if don't want overwrite existing one

## remove passphrase

```
ssh-keygen -p -f ~/.ssh/id_rsa
```

*note*: insert old password, then hit enter twice to remove

## add passphrase to an id_rsa that was generated without

```
ssh-keygen -p -f ~/.ssh/id_rsa
```

## host ECDSA

```
ssh-keygen -l -E sha256 -f /etc/ssh/ssh_host_ecdsa_key.pub
```
