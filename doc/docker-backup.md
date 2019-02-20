# docker backup

## through export, import

### backup

```sh
docker export containername > backup01.tar
```

### restore image

```sh
docker import backup01.tar backup01
```

## recreate container

**note** volume, container name, and other run options need to be specified

```sh
docker run [options] backup01
```

## through image commit, save, load

### create an image of current container ( pausing during commit )

**note** volumes need to be saved separately

```sh
docker commit -p containername backup01
```

### save image to a file

```sh
docker save -o backup01.tar backup01
```

### restore container image

```sh
docker load -i backup01.tar
```
