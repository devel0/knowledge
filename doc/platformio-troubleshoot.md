# platformio troubleshoot

## debug won't start

could caused by watch variables calling some function, try to remove all watches.

## platformio package publish troubleshoot

prune and cleanup cache:

from platformio console

```sh
pio system prune
rm -fr ~/.platformio/packages
rm -fr ~/.platformio/platforms
```

install dev-platform again
