# trap ctrl+c

*[shell](../README.md#shell)*

[download](trap-ctrlc-example)

```sh
function trap_ctrlc()
{
	echo "ctrl+c caught"

	# ctrl+c callback stuffs here

	exit 2
}

# SIGINT=2 ( man 7 signal )
trap "trap_ctrlc" 2

while true; do
	echo "$(date) : loop action"
	sleep 1
done
```

## references

- [signal(7)](http://man7.org/linux/man-pages/man7/signal.7.html)
