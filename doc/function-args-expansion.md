# function arguments expansion

## example

```sh
# args: groupname [args...]
creategroup()
{
	samba-tool group add "$1" "${@:2}"
}

creategroup MyUsers --description="My Users"
```

## remarks

- to make the expansion work correctly, the arguments of the input strings must be enclosed in double quotation marks (eg. "$1")
