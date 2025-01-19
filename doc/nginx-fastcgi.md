# nginx fastcgi

## prerequisites

```sh
apt install fcgiwrap
```

## setup

### nginx conf

- into an `/etc/nginx/conf.d/somesite.conf`

```sh
location /scripts
{
    gzip off;
    fastcgi_pass unix:/var/run/fcgiwrap.socket;
    include fastcgi_params;
}
```

### script sample

- assuming the site document root is `/var/www/html`, create a folder `/var/www/html/scripts` with the follow file

`/var/www/html/scripts/hello.sh`


```sh
#!/bin/bash

echo 'Content-Type: text/plain'
echo ''
echo 'Hello, world!'
```

### test it

- restart nginx `service nginx restart`

- access to `https://name.somesite/scripts/hello.sh`
