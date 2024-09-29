# nextcloud

- [ignore folders](#ignore-folders)
- [server side rescan](#server-side-rescan)
- [delete locks](#delete-locks)
- [use of redis locking](#use-of-redis-locking)
- [get nextcloud config](#get-nextcloud-config)
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

## use of redis locking

- create a container named `redis` in the same net of nextcloud `docker run -d --name "redis" --restart=unless-stopped --network SOMENET redis`
- add environment "-e REDIS_HOST=redis"
- verify config `https://]CLOUD-HOST]/ocs/v2.php/apps/serverinfo/api/v1/info` should retrieve follows:

```xml
<memcache.distributed>\OC\Memcache\Redis</memcache.distributed>
<filelocking.enabled>yes</filelocking.enabled>
<memcache.locking>\OC\Memcache\Redis</memcache.locking>
```

## get nextcloud config

```
https://]CLOUD-HOST]/ocs/v2.php/apps/serverinfo/api/v1/info
```

## troubleshoot

### 413 Request Entity Too Large

assuming using apache based nextcloud image `nextcloud:29.0.0`

- create docker with following parameters

```sh
-e PHP_MEMORY_LIMIT=512M \
-e PHP_UPLOAD_LIMIT=100G \
-e APACHE_BODY_LIMIT=107374182400 \
```

- tune nginx.conf with following

```conf
server {
  root /var/www/html;

  server_name cloud.example.com;

  location / {
    include /etc/nginx/mime.types;

    client_max_body_size 0; # <--- THIS
    
    proxy_set_header Host $host;
    proxy_pass http://aaa.bbb.ccc.ddd;    
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;    
  }

  listen 443 ssl; # managed by Certbot

  ssl_certificate /etc/letsencrypt/live/cloud.example.com/fullchain.pem; # managed by Certbot
  ssl_certificate_key /etc/letsencrypt/live/cloud.example.com/privkey.pem; # managed by Certbot
  include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
  ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot
}

server {
  if ($host = cloud.example.com) {
    return 301 https://$host$request_uri;
  } # managed by Certbot

  server_name cloud.example.com;
  listen 80;
  return 404; # managed by Certbot
}
```