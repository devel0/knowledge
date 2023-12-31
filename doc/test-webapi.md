# test webapi

- [send post data](#send-post-data)
- [send encoded OData query](#send-encoded-odata-query)
- [send curl request through proxy](#send-curl-request-through-proxy)
- [references](#references)

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

```sh
curl -d "a=1&b=strval" -X POST http://localhost:5000
```

```sh
curl -d '{"a":1, "b":"strval"}' -H "Content-Type: application/json" -X POST http://localhost:5000
```

## send encoded OData query

```sh
curl --get --data-urlencode "\$top=1" http://some/odata/Dataset
```

## send curl request through proxy

using [mitmweb](https://github.com/mitmproxy/mitmproxy) can analyze localhost traffic

```sh
curl -x "http://localhost:8080" http://some/odata/Dataset
```

## references

- [curl POST examples](https://gist.github.com/subfuzion/08c5d85437d5d4f00e58)
