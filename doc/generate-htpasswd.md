# generate htpasswd

*[security](../README.md#security)*

## prerequisites

```sh
apt-get install -y apache2-utils
```

## create

```
htpasswd -c .htpasswd username
```

## update

```
htpasswd .htpasswd username
```
