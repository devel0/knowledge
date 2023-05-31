# docker buildx

Sometime it's needed to build the image using specific subnet for security reason, as of [docker v23](https://docs.docker.com/engine/deprecated/#legacy-builder-for-linux-images) the `docker build --network=xxx` is deprecated:

```sh
$ docker build --network=mybuild -t myimage .

ERROR: network mode "build" not supported by buildkit - you can define a custom network for your builder using the network driver-opt in buildx create
```

To solve you need to create a builder:

```sh
docker buildx create --name mybuilder --driver docker-container --driver-opt network=build --use
```

Then build:

```sh
docker buildx build -t myimage --builder=mybuilder --load .
```

## troubleshoot FROM not find local image

Building a dockerfile the `FROM myimage` not search image in local

```sh
 => ERROR [internal] load metadata for docker.io/myimage
```

This could happen because marked the non default builder previously, to solve:

```sh
docker buildx use default
```