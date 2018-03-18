# function arguments expansion

*shell*

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

- in order to make expansion to work correctly respect input strings arguments need to enclosed into double quote (eg. "$1")
