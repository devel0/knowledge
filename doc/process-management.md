# process management

## user belong to a process

```sh
ps aux
```

## process with data,text,virtual memory in mb

[psmem](https://github.com/devel0/linux-scripts-utils/blob/master/psmem)

## show processes swap memory usage

```sh
for file in /proc/[0-9]*/status; do 
  awk '/VmSwap|Name/{printf $2 " " $3} END{print ""}' "$file"
done | sort -k 2 -n -r
```
