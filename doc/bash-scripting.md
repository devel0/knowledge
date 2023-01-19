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

**note**:
- `$@` variable MUST double quoted to avoid string space splitting
- `$0` is the executing script filename
- `$1` is the first argument

```sh
function test()
{
	another_process "$@"
}

test "sample 1" "sample 2"
```

## decimal numeric test using bc

```sh
a="12.1875"

if (( $(echo "$a > 12.187" | bc -l) )); then
	echo "[$a] is great than 12.187"
fi

if (( ! $(echo "$a > 12.1876" | bc -l) )); then
	echo "[$a] is not great than 12.1876"
fi
```

## file age in seconds/months

```sh
# args: $1=pathfilename
# returns: fileage in seconds
function fileagesecs()
{
        echo "$(( $(date +%s) - $(date +%s -r "$1") ))"
}

# args: $1=pathfilename
# returns: fileage in months (w/decimals)
function fileagemonths()
{
        echo "$(echo "$(fileagesecs $1) / (365 / 12 * 60 * 60 * 24)" | bc -l)"
}

echo "test filename age:"
echo "$(fileagesecs filename) secs"
echo "$(fileagemonths filename) months"
```

# check if string contains another

- using wildcard

```sh
if [[ "$str" == *"portion"* ]]; then echo "it contains"; fi
```

- using regex

```sh
if [[ "$str" =~ .*"portion".* ]]; then echo "it contains"; fi
```

# OR condition

```sh
if [[ EXPR1 || EXPR2 ]]; then echo "or satisfied"; fi
```
