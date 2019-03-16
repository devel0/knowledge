# https proxy sniffer

```sh
docker run --name=mitproxy --rm -it -v ~/.mitmproxy:/home/mitmproxy/.mitmproxy -p 8080:8080 mitmproxy/mitmproxy
```

- set proxy ip address of application to test to the ip from `dk-ip mitproxy`
- may set `--network=build` on docker cmdline to change default network
