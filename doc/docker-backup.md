# docker backup

<!-- TOC -->
* [through export, import](#through-export-import)
  + [backup](#backup)
  + [restore image](#restore-image)
* [recreate container](#recreate-container)
* [through image commit, save, load](#through-image-commit-save-load)
  + [create an image of current container ( pausing during commit )](#create-an-image-of-current-container--pausing-during-commit-)
  + [save image to a file](#save-image-to-a-file)
  + [restore container image](#restore-container-image)
<!-- TOCEND -->

<hr/>

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
docker run -ti [options] backup01 /bin/bash
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
