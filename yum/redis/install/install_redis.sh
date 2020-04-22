#!/bin/bash
image_name="redis5-centos7"
container_name="redis5"

flag=$(docker images | grep ${image_name})
if [ -z "${flag}" ]; then
    docker build -t ${image_name} .
else
	echo "image [${image_name}] is exist"
fi

flag=$(docker ps -a | grep ${container_name})
if [ -z "${flag}" ]; then
	cp -rf ./etc/ /
    mkdir -p /var/local/redis
    cp -rf ./src /var/local/redis
	docker run --name ${container_name}  \
        -p 6379:6379 \
        -v /etc/redis/:/etc/redis/:ro \
        -v /var/log/redis/:/var/log/redis/ \
        -d ${image_name}
else
    echo "container [${container_name}] is exist"
fi

echo "[end]......"
docker images
docker ps -a
