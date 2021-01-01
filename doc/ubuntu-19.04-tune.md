# ubuntu 19.04 tune

## peek not record mouse cursor

related [issue](https://github.com/phw/peek/issues/430)

workaround

```sh
mv /usr/bin/peek /usr/bin/peek.wrap
echo -e '#!/bin/bash\n/usr/bin/peek.wrap -b ffmpeg $@' > /usr/bin/peek && chmod +x peek
```

## clock at right

- install "Frippery Move Clock" gnome shell extension
