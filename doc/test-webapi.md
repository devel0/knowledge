# test webapi

<!-- TOC -->
* [send post data](#send-post-data)
* [references](#references)
<!-- TOCEND -->

<hr/>

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

## send post data

```
curl -d "a=1&b=strval" -X POST http://localhost:5000
```

```
curl -d '{"a":1, "b":"strval"}' -H "Content-Type: application/json" -X POST http://localhost:5000
```

## references

- [curl POST examples](https://gist.github.com/subfuzion/08c5d85437d5d4f00e58)
