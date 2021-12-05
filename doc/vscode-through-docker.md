# vscode through docker

- create a container i.e.

```sh
docker run -h sample --name=sample -ti mcr.microsoft.com/dotnet/core/sdk /bin/bash
```

where `-h sample` will set hostname (optional)
and `--name=sample` will set the container name (optional)

- after container created, thanks to `-ti` flag, the bash process started, now create a user ( may use the same name of your own local account just to use proposed username when you'll connect from vscode to remote host )

```sh
useradd -m -s /bin/bash devel0
```

note: use bash else /bin/sh will fail for vscode remote host conn parser

- set the user pass

```sh
passwd devel0
```

- install openssh server

```sh
apt update
apt install openssh-server
service ssh start
```

- now, from local vascode click on left bottom green icon and choose "Connect to Host..." then insert the ip address of the container you can retrieve with `ip a` from the docker container
- accept first fingerprint acknowledge of the ssh then enter the password you assigned to the user
