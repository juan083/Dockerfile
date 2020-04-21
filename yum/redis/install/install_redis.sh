#!/bin/bash

cp -rf ./etc/ /etc/

mkdir -p /usr/local/redis/src/

cp ./src/redis-cli /usr/local/redis/src/

docker build -t redis5-centos7 ../

docker run --name redis5  \
-p 6379:6379 \
-v /etc/redis/:/etc/redis/:ro \
-v /var/log/redis/:/var/log/redis/ \
-d redis5-centos7

docker images
docker ps -a
