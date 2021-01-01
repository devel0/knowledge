# remove image exif

## install

```sh
apt install libimage-exiftool-perl
```

## usage

```sh
exiftool -all= imagefile
```

to avoid backup file created use

```sh
exiftool -all= -overwrite_original imagefile
```
