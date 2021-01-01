# video transcoding

<!-- TOC -->
- [video transcoding](#video-transcoding)
  * [convert video to images](#convert-video-to-images)
  * [recompose back image to video](#recompose-back-image-to-video)
  * [gui tools](#gui-tools)
  * [fast mp4 edit](#fast-mp4-edit)
  * [remove audio](#remove-audio)
  * [video editor](#video-editor)
  * [rotate video](#rotate-video)
- [m2t to mpg seekable](#m2t-to-mpg-seekable)
<!-- TOCEND -->

<hr/>

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

```sh
apt install handbrake
```

note: choose `Web / Gmail Medium 5 Minutes 480p30` profile to reduce video taken with phone

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
