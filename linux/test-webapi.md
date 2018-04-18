# test webapi

*linux*

```sh
#!/bin/bash

url="http://localhost:5000"
api="Sample/LoadData"

json=$(cat<<EOF
{
}
EOF
)

res=$(curl -v -s -H "Content-Type:application/json" -d "$json" $url/$api)

echo $res
```
