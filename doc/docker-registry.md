# docker registry

## login

```sh
docker login registry-host -u username
```

## logout

```sh
docker logout registry-host
```

## list remote registry images

[script](https://github.com/devel0/linux-scripts-utils/blob/adf739718c2a5b06b6c1d760df06bd3bd63f3890/dk-list-remote-registry-images)

```sh
curl https://registry-host/v2/_catalog --user user:pass
```

or simply, login then issue `docker images remote-host/*`

## list remote registry image tags

[script](https://github.com/devel0/linux-scripts-utils/blob/adf739718c2a5b06b6c1d760df06bd3bd63f3890/dk-list-remote-registry-tags)

```sh
curl https://registry-host/v2/imagename/tags/list --user user:pass
```

or simply, login then issue `docker images remote-host/imagename:*`

## delete remote registry image

[script](https://github.com/devel0/linux-scripts-utils/blob/cba35f627263057ce506fedb0dcb1a7b98939092/dk-rmi-remote-registry)
