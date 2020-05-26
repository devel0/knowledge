# stream dvbt to chromecast

- create channels list ( note: set your country with -c flag )

```sh
w_scan -X -P -t 2 -E 0 -c IT > ~/dvb-channels.conf
```

- open vlc
  - media/open file : choose dvb-chanels.conf
  - switch to channel using "toggle playlist" button ( or CTRL+L )
  - cast with Playback/Renderer/(cast device name)
