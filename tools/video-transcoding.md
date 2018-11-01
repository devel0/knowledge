# video transcoding

*tools*

## gui tools

- handbrake ( transcode )

```
apt install handbrake
```

## fast mp4 edit

- [avidemux](http://avidemux.sourceforge.net/download.html)

## remove audio

```
ffmpeg -i input.mp4 -vcodec copy -an output.mp4
```
