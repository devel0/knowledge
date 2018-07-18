# bash scripting

*linux*

## loop through files arguments

- Use "$@" to grab pathfilenames passed as argument
- will work with "file with space" names

```sh
#!/bin/bash

for i in "$@"; do
	echo "file [$i]"
done
```
