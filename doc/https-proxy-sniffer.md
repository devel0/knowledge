# https proxy sniffer

*[networking](../README.md#networking)*

## console mode

```sh
docker run --name=mitproxy --rm -it -v ~/.mitmproxy:/home/mitmproxy/.mitmproxy -p 8080:8080 mitmproxy/mitmproxy
```

- set proxy ip address of application to test to the ip from `dk-ip mitproxy`
- may set `--network=build` on docker cmdline to change default network

## web interface mode

```sh
docker run --name=mitproxy --network=build --rm -it -v ~/.mitmproxy:/home/mitmproxy/.mitmproxy -p 8080:8080 -p 127.0.0.1:8081:8081 mitmproxy/mitmproxy mitmweb --web-iface 0.0.0.0
```
