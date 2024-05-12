# nextcloud

- [ignore folders](#ignore-folders)
- [server side rescan](#server-side-rescan)
- [delete locks](#delete-locks)
- [troubleshoot](#troubleshoot)
  - [413 Request Entity Too Large](#413-request-entity-too-large)

## ignore folders

on the client 3dots menu -> edit ignored files ( [pattern details](https://docs.nextcloud.com/desktop/2.5/architecture.html#ignored-files) )

for example to exclude `node_modules` folders use something like follow:

```
node_modules/
```

## server side rescan

```sh
sudo -u www-data php occ files:scan --all -v
```

## delete locks

sometimes occurs some internal lock that not autorelease ; for example you cannot create a folder

- put in maintenance cloud by settings `'maintenance' => true,` in config/config.php
- issue a `delete from oc_file_locks` from the cloud db
- revert maintenance mode


## troubleshoot

### 413 Request Entity Too Large

edit nginx under http or in specific ( ie. `/etc/nginx/conf.d/cloud.conf` )

```
client_max_body_size 20000M; # 20gb or 0 to disable the check

server {
  root /var/www/html;

  server_name cloud.DOMAIN;

  location / {
    include /etc/nginx/mime.types;

    proxy_set_header Host $host;
    proxy_pass http://xx.yy.zz.ww;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
  }
}
```