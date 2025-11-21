# dpkg

- [retrieve just dpkg package](#retrieve-just-dpkg-package)
- [build source package](#build-source-package)
  - [prerequisites](#prerequisites)
  - [retrieve source of a package and compile](#retrieve-source-of-a-package-and-compile)
- [remove dependency](#remove-dependency)
- [create a deb from a folder](#create-a-deb-from-a-folder)

## retrieve just dpkg package

```sh
apt download packagename
```

## build source package

### prerequisites

- uncomment one of more deb-src repository from `/etc/apt/sources.list`

```sh
sudo apt install build-essential fakeroot dpkg-dev
```

### retrieve source of a package and compile

```sh
mkdir build
cd build
sudo apt-get source foo
sudo apt-get build-dep foo
dpkg-buildpackage -rfakeroot -b
```


## remove dependency

if want to remove some dependency

```sh
mkdir tmp
cd tmp
ar -x ../FILE.deb
tar xf control.tar.xz
```

edit the file control removing dependency from `Pre-Depends` or `Depends` list.

```sh
tar cfJ control.tar.xz control
ar rcs ../FILE.deb debian-binary control.tar.xz data.tar.xz
cd ..
rm -fr tmp
```

## create a deb from a folder

assume follow prj-folder contains a tgz distribution, for example:

```
myapp
└── usr
    ├── bin    
    │   └── myapp
    ├── etc
    │   └── xxx
    ├── include
    │   └── myapp.h
    ├── lib
    │   └── libmyapp.so
    └── share
        ├── applications
        ├── doc
        ├── icons
        ├── menu
        ├── mime
        ├── pixmaps
        ├── myapp
        └── thumbnailers
```

to create a deb package just create a folder `myapp/DEBIAN` with a manifest file inside named `control`, for example:

`myapp/DEBIAN/control`

```
Package: myapp
Version: 1.0
Architecture: amd64
Maintainer: Firstname Lastname <email@sample.com>
Description: Program description short.
 Program description long.
```

note: architecture depends on the binary arch type.

Create .deb package by issueing from outside the myapp folder:

```sh
dpkg-deb -v --build --root-owner-group myapp
```
