# raid management

## stop resync

```sh
echo frozen > /sys/block/md0/md/sync_action
```

## restart rsync

```sh
echo none > /sys/block/md0/md/resync_start
echo idle > /sys/block/md0/md/sync_action
```

## change raid reconstruction max speed

follows slow down to max 30mb/s reconstruction speed

```sh
echo 30000 > /proc/sys/dev/raid/speed_limit_max
```
