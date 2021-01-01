# nginx-webapi-conf

- `/etc/nginx/nginx.conf`
  - replace `/etc/ssl/certs/searchathing.com.crt` and `/etc/ssl/certs/searchathing.com.key` with your own

```
events
{
}

http {
        index index.html;        
        
        client_max_body_size 5120M;
        proxy_connect_timeout 1600;
        proxy_send_timeout 1600;
        proxy_read_timeout 1600;
        send_timeout 1600;

        server {
                listen 80 default_server;
                listen [::]:80 default_server;
                server_name _;
                rewrite ^ https://$host$request_uri? permanent;
        }

        ssl_certificate /etc/ssl/certs/searchathing.com.crt;
        ssl_certificate_key /etc/ssl/private/searchathing.com.key;
        ssl_protocols TLSv1.2;

        include /etc/nginx/conf.d/*.conf;
}

```

- `/etc/nginx/conf.d/my.conf`
  - replace:
    - `sec0.searchathing.com` with your host webapi name
    - `10.10.0.58:80` with html pages web server
    - `http://10.10.0.58:5000` with webapi address
    - change `/Api` case name if required

```
server {
        listen 443 ssl;
        listen [::]:443 ssl;

        root /var/www/html;

        server_name sec0.searchathing.com;

        location / {
                proxy_set_header Host $host;
                proxy_pass http://10.10.0.58:80;
        }

        location ~ /Api/(?<ns>.*) {
                proxy_set_header Host $host;
                proxy_pass http://10.10.0.58:5000/Api/$ns?$args;
                proxy_set_header X-Real-IP $remote_addr;
                proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        }
}
```

## basic auth

- create a passwd file

```sh
htpasswd -c authfile username
```

- set security mask

```
chmod 640 authfile
chgrp nginx authfile
```

- create a conf.d file `/etc/nginx/conf.d/siteauth.conf`

```
server {
	listen 443 ssl;
        listen [::]:443 ssl;

        server_name doc.searchathing.com;

        location / {
		      proxy_set_header Host doc.searchathing.com;
		      proxy_pass http://doc.searchathing.com:8080;
		      auth_basic "Restricted Content";
		      auth_basic_user_file /htpasswd/authfile;
        }
}
```
