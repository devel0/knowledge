# nano editor

*[tools](../README.md#tools)*

## enable syntax highlight

- include csharp syntax highlight ( using java file )

```sh
nanorcdir=/usr/share/nano
if [ ! -e "$nanorcdir" ]; then
  echo "not found nano resource files in [$nanorcdir]"
else
  if [ ! -e "$nanorcdir"/csharp.nanorc ]; then
    cat "$nanorcdir"/java.nanorc | sed 's/\.java/\.cs/g' | sed 's/java/csharp/I' > "$nanorcdir"/csharp.nanorc
  fi
  ls -1 "$nanorcdir"/*.nanorc | sed 's/^\//include \//' >> ~/.nanorc
fi
```
