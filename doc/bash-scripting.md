# bash scripting

- [string](#string)
  - [delete empty files](#delete-empty-files)
  - [skip first N lines](#skip-first-n-lines)
  - [extract substring](#extract-substring)
  - [check if string contains another](#check-if-string-contains-another)
  - [references](#references)
- [files](#files)
  - [loop through files arguments](#loop-through-files-arguments)
  - [loop through file lines](#loop-through-file-lines)
  - [loop over find results](#loop-over-find-results)
- [file age in seconds/months](#file-age-in-secondsmonths)
- [control](#control)
- [OR condition](#or-condition)
  - [function with arguments](#function-with-arguments)
- [math](#math)
  - [decimal numeric test using bc](#decimal-numeric-test-using-bc)


## string

### delete empty files

```sh
awk 'NF'
```

### skip first N lines

```sh
tail -n +<N+1>
```

### extract substring

`expr substr STR begin len` ( begin : 1-based index )

```sh
#                    amp
# pos 1-based index:123456
echo $(expr substr "sample" 2 3)
```

results in "amp"

### check if string contains another

- using wildcard

```sh
if [[ "$str" == *"portion"* ]]; then echo "it contains"; fi
```

- using regex

```sh
if [[ "$str" =~ .*"portion".* ]]; then echo "it contains"; fi
```

### references

- [arrays](https://opensource.com/article/18/5/you-dont-know-bash-intro-bash-arrays)
- [cheat sheet](https://devhints.io/bash)

## files

### loop through files arguments

- Use "$@" to grab pathfilenames passed as argument
- will work with "file with space" names

```sh
#!/bin/bash

for i in "$@"; do
	echo "file [$i]"
done
```

### loop through file lines

```sh
readarray -t myarr < <(cat filename.txt)
for line in "${myarr[@]}"; do echo "line = [$line]"; done
```

notes:
- `cat filename.txt | readarray -t myarr` would not work because readarray (*builtin cmd*) will be in a subshell and couldn't access given stdin
- array size is "${#myarr[@]}"
- "${myarr[i]}" is the zero-based i-th item

### loop over find results

follow example search folders from current dir limiting depth 1th level and executes a control body foreach result

```sh
readarray -t myarr < <(find . -maxdepth 1 -type d -exec echo "{}" \;)

for line in "${myarr[@]}"; do
    echo "do something with [$line]"
done
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

## control

## OR condition

```sh
if [[ EXPR1 || EXPR2 ]]; then echo "or satisfied"; fi
```

### function with arguments

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

## math

### decimal numeric test using bc

```sh
a="12.1875"

if (( $(echo "$a > 12.187" | bc -l) )); then
	echo "[$a] is great than 12.187"
fi

if (( ! $(echo "$a > 12.1876" | bc -l) )); then
	echo "[$a] is not great than 12.1876"
fi
```