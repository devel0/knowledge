# dpkg deb modify

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
