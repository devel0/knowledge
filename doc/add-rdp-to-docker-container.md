# add rdp to docker container

## choose between

- **twm** ( spartan but light )

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

- **openbox** ( light but user friendly )

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

## start xrdp

enter the container and issue `service xrdp start` or run with specific entrypoint
