# self check disk health

*[linux](../README.md#linux)*

```sh
for i in a b c d e f; do
	smartctl -q silent -a /dev/sd$i; excode=$?; if (($excode & 8)); then
		echo "disk [/dev/sd$i] failing; verify smartctl -a /dev/sd$i"
	fi;
done
```
