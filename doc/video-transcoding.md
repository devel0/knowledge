# video transcoding

*[media](../README.md#media)*

## convert video to images

```sh
ffmpeg -i file.mp4 image%04d.jpg -hide_banner
```

## recompose back image to video

```sh
ffmpeg -i image%04d.jpg file.mp4 -hide_banner
```

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

## video editor

```
openshot
```

## rotate video

```
apt install openshot
```

- drag file into profile files then in a track
- right click on the video Rotate/option
- File/Export video

# m2t to mpg seekable

```sh
ffmpeg -i input.m2t -vcodec copy -acodec copy output.mpg
```
