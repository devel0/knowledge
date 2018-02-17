# autosync local

*(nextcloud)*

first install [rclone](https://rclone.org/downloads/) then issue

```
rclone config
```

to create initial configuration ( eg. name mycfg )

Follow script is designed to continue rsync local when changes happens by using inotify watches.
If a change occur during rclone a dirty temp file allow to keep changes to be synced.

```sh
#!/bin/bash

SRC=/some-local-path
DST=mycfg:remotepath

DIRTY=$(mktemp -q /tmp/sync_nextcloud.XXXXXX)

function dosync()
{
        rm -f $DIRTY
        echo -n "--> running sync..."
        rclone sync $SRC $DST
        echo "DONE"

        if [ -e $DIRTY ]; then
                echo "--> changes during sync"
                dosync&
        fi
}

echo "watching [$SRC] for changes..."

inotifywait -mrq -e create -e modify -e delete --format "%w%f" "$SRC" | while read file; do
        touch $DIRTY
        if [ "$(ps ax | grep rclone | grep -v grep)" == "" ]; then
                dosync&
        fi
done
```
