# battery nfo

| file                                      | description       | mu                     |
| ----------------------------------------- | ----------------- | ---------------------- |
| `/sys/class/power_supply/BAT0/capacity`   | residual capacity | %                      |
| `/sys/class/power_supply/BAT0/energy_now` | residual capacity | μWh                    |
| `/sys/class/power_supply/BAT0/status`     | battery activity  | `Charging|Discharging` |
| `/sys/class/power_supply/BAT0/power_now`  | current           | μW                     |

- example 1

```sh
devel0@nb-pro:~/opensource/knowledge$ cat /sys/class/power_supply/BAT0/{capacity,energy_now,status,power_now}
46
16923000
Discharging
7419000
```

battery capacity is 46% ( 16.923Wh ) and discharging with 7.419W

- example 2

```sh
devel0@nb-pro:~/opensource/knowledge$ cat /sys/class/power_supply/BAT0/{capacity,energy_now,status,power_now}
46
16772000
Charging
26287000
```

battery capacity is 46% ( 16.772Wh ) and charging with 26.287W
