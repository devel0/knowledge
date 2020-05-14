# add rdp to docker container

## choose between

- **twm** ( spartan but light ) an xterm will appears at start; use middle button to lower a window

```Dockerfile
FROM ubuntu
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get install -y xrdp
RUN apt-get install -y twm xterm
RUN apt-get install -y sudo && \
  useradd -m user && echo "user:user" | /usr/sbin/chpasswd && \
  echo "user ALL=(ALL) ALL" >> /etc/sudoers
RUN cp /etc/X11/twm/system.twmrc /home/user/.twmrc && \
  echo 'RandomPlacement' >> /home/user/.twmrc && \   
  echo 'OpaqueMove' >> /home/user/.twmrc && \
  echo 'xterm &' > /home/user/.xsession && \  
  echo 'xclipboard &' >> /home/user/.xsession && \
  echo 'exec twm' >> /home/user/.xsession && \
  chmod +x /home/user/.xsession && \  
  chown -R user.user /home/user
```

- **openbox** ( light but user friendly ) mouse right button to open menu

```Dockerfile
FROM ubuntu
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get install -y xrdp
RUN apt-get install -y openbox xterm
RUN apt-get install -y sudo && \
  useradd -m user && echo "user:user" | /usr/sbin/chpasswd && \
  echo "user ALL=(ALL) ALL" >> /etc/sudoers
```

- **xfce4** ( featured )

```Dockerfile
FROM ubuntu
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get install -y xrdp
RUN apt-get install -y xfce4
RUN apt-get install -y sudo && \
  useradd -m user && echo "user:user" | /usr/sbin/chpasswd && \
  echo "user ALL=(ALL) ALL" >> /etc/sudoers
```

## add vscode (optional)

append at end of dockerfile follow ( .deb package must already downloaded outside container )

```Dockerfile
RUN apt-get install -y libnotify4 libnss3 libsecret-1.0 libasound2
COPY code-insiders_1.46.0-1589191718_amd64.deb /
RUN dpkg -i /code-insiders_1.46.0-1589191718_amd64.deb
```

## start xrdp

enter the container `localhost` ( user, user ) and issue `service xrdp start` or run with specific entrypoint

```sh
docker run -p 3389:3389 -ti myimage /bin/bash
```
