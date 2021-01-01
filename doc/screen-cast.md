# screen cast

<!-- TOC -->
- [screen cast](#screen-cast)
  * [install](#install)
  * [transcode to gif](#transcode-to-gif)
  * [transcode to gif (optimized)](#transcode-to-gif-optimized)
    + [install](#install-1)
    + [usage](#usage)
  * [record terminal to gif](#record-terminal-to-gif)
  * [record pure terminal](#record-pure-terminal)
<!-- TOCEND -->

<hr/>

## install

```sh
apt-get install -y simplescreenrecorder
```

## transcode to gif

```sh
ffmpeg -i file.m4v out.gif
```

## transcode to gif (optimized)

### install

- [gifify](https://github.com/vvo/gifify)

```sh
apt-get install -y imagemagick ffmpeg gifsicle
npm install -g gifify
```

- see also [notes](https://github.com/devel0/knowledge/blob/c8c5b0fdc1bcbff7889536de87fb5ad3e060e714/doc/ttyrec-ttygif.md#troubleshoot) about imagemagic policy mem limits

### usage

specify width with `--resize`

```sh
gifify file.m4v -o out.gif --resize 300:-1
```

## record terminal to gif

- [ttyrec/ttygif](https://github.com/icholy/ttygif/blob/master/README.md)

## record pure terminal

- [asciinema](https://github.com/asciinema/asciinema)
