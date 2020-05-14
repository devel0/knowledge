# add rdp to docker container

```Dockerfile
FROM ubuntu
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y xrdp gnome-session gnome-terminal
RUN apt-get install -y sudo && \
  useradd -m user && echo "user:user" | /usr/sbin/chpasswd && \
  echo "user ALL=(ALL) ALL" >> /etc/sudoers
```
