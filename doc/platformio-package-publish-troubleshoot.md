# platformio package publish troubleshoot

## prune and cleanup cache

from platformio console

```sh
pio system prune
rm -fr ~/.platformio/packages
rm -fr ~/.platformio/platforms
```

install dev-platform again
