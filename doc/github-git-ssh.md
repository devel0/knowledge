# github git ssh

## setup

- generate key

```sh
cd ~/.ssh
ssh-keygen -t rsa -f github.id_rsa
```

- edit `~/.ssh/config` ( replace devel0 with your username )

```
Host github.com
	User devel0
	IdentityFile ~/.ssh/github.id_rsa
```

- copy public key to [github ssh keys](https://github.com/settings/keys)

```sh
cat ~/.ssh/github.id_rsa.pub
```

- test access

```sh
devel0@tuf:~/.ssh$ ssh -T git@github.com 
Hi devel0! You've successfully authenticated, but GitHub does not provide shell access.
```

- test DENY

:warning: `ssh-add -D` will remove cached ssh agent keys

```sh
mv ~/.ssh/github.id_rsa ~/.ssh/github.id_rsa.disabled
ssh-add -D
```

now a login ty

```sh
devel0@tuf:~/.ssh$ ssh -T git@github.com  
sign_and_send_pubkey: signing failed for RSA "/home/devel0/.ssh/github.id_rsa" from agent: agent refused operation
git@github.com: Permission denied (publickey).
```

then restore valid key

```sh
mv ~/.ssh/github.id_rsa.disabled ~/.ssh/github.id_rsa
```

## convert https to git ssh access

to view current remote

```sh
git remote -v
```

if you have a working copy clone though https and want to switch to ssh can do with

```sh
git remote set-url origin git@github.com:USERNAME/REPO.git
```

the url can be retrieved from CLONE btn of your repo selecting ssh, example

```sh
git remote set-url git@github.com:devel0/iot-examples.git
```
