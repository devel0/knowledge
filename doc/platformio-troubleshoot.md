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

also remove `.pio` and `.vscode` from project and reopen vscode folder then CTRL+SHIFT+B and CTRL+SHIFT+U to upload

## nucleo f446re reset problem

```
Error: timed out while waiting for target halted
embedded:startup.tcl:1070: Error: ** Unable to reset target **
```

can be solved by changing reset config of `~/.platformio/packages/tool-openocd/scripts/board/st_nucleo_f4.cfg` as follow:

```
reset_config none separate
#reset_config srst_only
```
