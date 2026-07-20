# kubuntu desktop 26.04 post install

## reduce logging

if you see lot of

```
drkonqi-coredump-launcher.socket - Socket to launch DrKonqi for a systemd-coredump crash skipped, unmet condition check ConditionUser=!@system
```

this can be reduced by editing

```
/usr/lib/systemd/user/drkonqi-coredump-launcher.socket
```

setting

```
[Socket]
LogLevelMax=err
```

## audio mute under 35%

if got audio muted under 35% edit

```
/usr/share/alsa-card-profile/mixer/paths/analog-output.conf.common
```

```
[Element PCM]
switch = mute
volume = ignore
volume-limit = 0.01
```