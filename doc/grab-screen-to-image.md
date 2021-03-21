# grab screen to image

## single picture

```sh
import -window root ~/Desktop/test.jpg
```

## multiple time-lapse

this will record screen each 5min to a `~/Desktop/out` folder with files named xxxxxx.jpg where x start from 0

```sh
mkdir ~/Desktop/out;
let i=0; while true; do import -window root ~/Desktop/out/$(printf "%06d" $i).jpg; sleep 300; let i=$i+1; done
```
