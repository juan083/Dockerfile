#!/bin/bash
image_name="redis5-centos7"
container_name="redis5"

flag=$(docker images | grep ${image_name})
if [ -z "${flag}" ]; then
    docker build -t redis5-centos7 .
else
	echo "image [${image_name}] is exist"
fi

flag=$(docker ps -a | grep ${container_name})
if [ -z "${flag}" ]; then
	cp -rf ./etc/ /

	docker run --name redis5  \
        -p 6379:6379 \
        -v /etc/redis/:/etc/redis/:ro \
        -v /var/log/redis/:/var/log/redis/ \
        -d redis5-centos7
else
    echo "container [${container_name}] is exist"
fi

echo "[end]......"
docker images
docker ps -a
