# qucs

*[electronics](../README.md#electronics)*

quite universal circuit simulator

## build prerequisites

sh
```
apt install git flex bison build-essential libtool autoconf pkg-config libqt4-dev gperf
```

optionally `apt install octave`

## repositories

- https://github.com/Qucs/ADMS.git
- https://github.com/SearchAThing-forks/qucs.git

## build

```
cd ADMS
./bootstrap.sh
./configure && make && make install
cd ..
```

```
cd qucs
./bootstrap
./configure --with-mkadms=/usr/local/bin/admsXml && \
mv qucs-doc/Makefile qucs-doc/Makefile.orig && printf "all:\ninstall:" > qucs-doc/Makefile && \
make && make install
```
