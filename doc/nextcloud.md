# nextcloud

## ignore folders

on the client 3dots menu -> edit ignored files ( [pattern details](https://docs.nextcloud.com/desktop/2.5/architecture.html#ignored-files) )

for example to exclude `node_modules` folders use something like follow:

```
node_modules/
```

## server side rescan

```sh
sudo -u www-data php occ files:scan --all -v
```

## delete locks

sometimes occurs some internal lock that not autorelease ; for example you cannot create a folder

- put in maintenance cloud by settings `'maintenance' => true,` in config/config.php
- issue a `delete from oc_file_locks` from the cloud db
- revert maintenance mode
