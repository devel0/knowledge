# remotely assis linux can't boot

*[linux](../README.md#linux)*

## scenario

- remote pc:
  - doesn't start due boot problems
  - have a unbuntu desktop pendrive
  - have an ethernet device to connect internet
- assist pc:
  - have a server (may the assist pc itself with ip public) with ssh server with `PasswordAuthentication yes` and a `tempuser` with valid password

## purpose and requirements

- allow assist person to share same screen across ssh connection to problematic pc
- requires a person on remote pc to boot the system with pendrive

## howto

- remote person
  - boot pc using ubuntu desktop pendrive
  - choose Try
  - open terminal
  
```sh
sudo -i
passwd ubuntu
( enter a password and send to assist person )
apt-get update
apt install openssh-server screen mdadm
ssh -R 2200:127.0.0.1:22 tempuser@IPASSISTSERVER
```

- assist person
  - connect assist server

```sh
sudo -i
ssh -p 2200 ubuntu@localhost
( insert password from remote person )
```

after connected to pc that requires assistance as ubuntu user

```sh
sudo -i
screen
( press space )
```

- remote person can assist to same screen by connecting screen session

```sh
screen -ls
screen -x IDOFCONNECT
```

IDOFCONNECT example ( 28667.pts-1.docker-s-1vcpu-1gb-fra1-01 )
