# rclone

## config nextcloud

```sh
rclone config
```

- new remote
- type of storage: 31 (webdav)
- url: https://SERVER/remote.pho/webdav/
- vendor: 1 (nextcloud)
- user:
- password:
- bearer token: ""
- adv config: n

## list files

```sh
rclone list NAME:/FOLDERNAME
```

## copy file

```sh
rclone copy LOCALFILE NAME:/FOLDERNAME
```
