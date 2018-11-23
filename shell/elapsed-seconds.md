# elapsed seconds

*shell*

```sh
start=$(date +%s)

sleep 5

elapsed=$(($(date +%s) - $start))

echo $elapsed
```
