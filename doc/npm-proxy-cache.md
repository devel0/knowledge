# npm proxy cache

- reference : https://github.com/runk/npm-proxy-cache#readme

- install and run container locally

```sh
docker run -tid --restart=always --name=npm-proxy-cache --net=host -p 8080:8080 -t npm-proxy-cache --port 8080 --host 0.0.0.0 --expired --ttl=2592000
```

- set environments for local development
```
npm config set proxy http://localhost:8080/
npm config set https-proxy http://localhost:8080/
npm config set strict-ssl false
```

- set env inside a Dockerfile for example in your Dockerfile before [npm install](https://github.com/devel0/skeleton-netcore-ef-react-ts/blob/dd65a8889146b15097a3dae67b38744d6551c655/Dockerfile#L15) or [dotnet publish](https://github.com/devel0/skeleton-netcore-ef-react-ts/blob/dd65a8889146b15097a3dae67b38744d6551c655/Dockerfile#L23) when webdevel

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
