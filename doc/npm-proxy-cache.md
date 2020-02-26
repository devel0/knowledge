# npm proxy cache

- install and run container locally

```sh
docker run --restart=always --net=host -p 8080:8080 --name=npm-proxy-cache folha/npm-proxy-cache
```

- set environments for example in your Dockerfile before [npm install](https://github.com/devel0/skeleton-netcore-ef-react-ts/blob/dd65a8889146b15097a3dae67b38744d6551c655/Dockerfile#L15) or [dotnet publish](https://github.com/devel0/skeleton-netcore-ef-react-ts/blob/dd65a8889146b15097a3dae67b38744d6551c655/Dockerfile#L23) when webdevel

```Dockerfile
ENV NPM_CONFIG_STRICT_SSL=false
ENV HTTP_PROXY=http://10.10.0.200:8080
ENV HTTPS_PROXY=http://10.10.0.200:8080
```

replacing 10.10.0.200 with your dev workstation ip

- log npm registry activity

```sh
docker logs --follow --tail 10 npm-proxy-cache
```
