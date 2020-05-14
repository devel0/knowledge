# add rdp to docker container

## choose between

- **twm** ( spartan but light ) an xterm will appears at start

```Dockerfile
FROM ubuntu
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get install -y xrdp
RUN apt-get install -y twm xterm
RUN apt-get install -y sudo && \
  useradd -m user && echo "user:user" | /usr/sbin/chpasswd && \
  echo "user ALL=(ALL) ALL" >> /etc/sudoers
RUN echo 'twm &' > /home/user/.xsession && echo 'xterm &' >> /home/user/.xsession && chmod +x /home/user/.xsession && chown user.user /home/user/.xsession
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

append at end of dockerfile follow

```Dockerfile
RUN apt-get install -y libnotify4 libnss3 libsecret-1.0 && dpkg -i /code-insiders_1.46.0-1589191718_amd64.deb
```

## start xrdp

enter the container and issue `service xrdp start` or run with specific entrypoint
