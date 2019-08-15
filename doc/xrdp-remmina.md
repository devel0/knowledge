# xrdp remmina

*[networking](../README.md#networking)*

## prerequisites

```
apt install -y xrdp remmina lxde
```

## tune ~/.xsession

```
cat > ~/.xsession <<EOF
startlxde
EOF
chmod +x ~/.xsession
```

## remmina connection

- Server : localhost
- User name : xxx
- User password : xxx
- Color depth : RemoteFX (32bpp)
