#!/bin/bash

source /scripts/constants

container=pgadmin
container_image=dpage/pgadmin4:2.1
container_data=/nas/data/pgadmin
net=dkpgadmin
ip="$ip_dkpgadmin_srv"
cpus="3"
memory="256m"

dk-rm-if-exists "$container"

docker run \
	-d \
	--name="$container" \
	--network="$net" \
	--ip="$ip" \
	--restart="unless-stopped" \
	--env="PGADMIN_DEFAULT_EMAIL=user@example.com" \
	--env="PGADMIN_DEFAULT_PASSWORD=`cat /security/pgadmin/admin`" \
	--env="PGADMIN_SERVER_NAME=my.example.com" \
	--env="PGADMIN_ENABLE_TLS=False" \
	--volume="$container_data:/var/lib/pgadmin/storage" \
	--cpus="$cpus" \
	--memory="$memory" \
	"$container_image"
