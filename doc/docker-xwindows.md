# docker xwindows

suppose you have a running container with an X windows application in it that you would to see in the local host

```sh
docker run -tid --name somex ubuntu
docker exec -ti somex /bin/bash
apt update
apt install x11-apps
root@21adbf3c42d9:/# xeyes 
Error: Can't open display: 
```

to allow the `somex` container to run x11 you can *commit* to another mapping `/tmp/.X11-unix` and setting the `DISPLAY` environment

follow command will save current container state to a new image named `somex2`
```sh
docker commit somex somex2
```

this allow us to remove previously and create another one within new volume mapping and environment settings:

```sh
docker stop somex && docker rm somex
docker run -tid --name somex --env="DISPLAY" -v /tmp/.X11-unix:/tmp/.X11-unix somex2
```

now the cmd can be run

```sh
docker exec somex xeyes
```

if get the unauth x11 error

```
Authorization required, but no authorization protocol specified
Error: Can't open display: :0
```

can be solved through `xhost local:root` to allow root user on local machine to connect the x11 protocol.