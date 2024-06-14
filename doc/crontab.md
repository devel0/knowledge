# crontab

## edit

```sh
crontab -e
```

## exec program

- execute given `SOMECMD` grabbing output to the logger with given TAG 

```sh
# m h  dom mon dow   command
40 * * * * SOMECMD 2>&1 | logger -t TAG
```
