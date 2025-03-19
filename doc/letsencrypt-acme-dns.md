# letsencrypt acme dns

## purpose

create wildcard certificate *.somedomain

## prerequisites

```sh
apt install certbot
cd /etc/letsencrypt
wget https://github.com/joohoi/acme-dns-certbot-joohoi/raw/master/acme-dns-auth.py
chmod +x acme-dns-auth.py

apt install python-is-python3
```

## request initial cert

```sh
sudo certbot certonly \
    --manual \
    --manual-auth-hook /etc/letsencrypt/acme-dns-auth.py \
    --preferred-challenges dns \
    --debug-challenges \
    -d \*.somedomain \
    -d somedomain
```

this will print the CNAME you had to enter your public dns to enable verification,
after you inserted the `_acme-challenge.somedomain` CNAME record with the requested value the client print `SOMEUID.auth.acme-dns.io` the script continue generating the certificate

you can check if the public dns updated for the inserted record with

```sh
dig +short _acme-challenge.somedomain CNAME
```

## renew cert

insert crontab with `crontab -e` following to check if cert renewal required each sunday

```sh
# m h  dom mon dow   command
0 0 * * 0 /usr/bin/certbot renew
````

