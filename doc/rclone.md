# rclone

## config nextcloud

```sh
rclone config
```

- new remote
- type of storage: WebDav
- url: https://SERVER/remote.php/webdav/
- vendor: 1 (nextcloud)
- user:
- password:
- bearer token: ""
- adv config: n

## list files

```sh
rclone ls NAME:/FOLDERNAME
```

## copy file

```sh
rclone copy LOCALFILE NAME:/FOLDERNAME
```

## sync remote folder

```sh
rclone sync NAME:/FOLDERNAME DESTFOLDER
```