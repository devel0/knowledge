# bash scripting

*[shell](../README.md#shell)*

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
