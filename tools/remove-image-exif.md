# remove image exif

*utils*

## install

```
apt install libimage-exiftool-perl
```

## usage

```
exiftool -all= imagefile
```

to avoid backup file created use

```
exiftool -all= -overwrite_original imagefile
```
