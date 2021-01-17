# bash scripting

## loop through files arguments

- Use "$@" to grab pathfilenames passed as argument
- will work with "file with space" names

```sh
#!/bin/bash

for i in "$@"; do
	echo "file [$i]"
done
```

## loop through file lines

```sh
while IFS='' read -r line || [[ -n "$line" ]]; do
    echo "line = [$line]"    
done < "filename.txt"
```

## function with arguments

**note**: `$@` variable MUST double quoted to avoid string space splitting

```sh
function test()
{
	another_process "$@"
}

test "sample 1" "sample 2"
```

## decimal numeric test using bc

a="12.1875"

if (( $(echo "$a > 12.187" | bc -l) )); then
	echo "[$a] is great than 12.187"
fi

if (( ! $(echo "$a > 12.1876" | bc -l) )); then
	echo "[$a] is not great than 12.1876"
fi
