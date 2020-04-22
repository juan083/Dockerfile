#!/bin/bash

image_name="mysql8-centos7"
container_name="mysql8"

flag=$(docker images | grep ${image_name})
if [ -z "${flag}" ]; then
    docker build -t ${image_name} .
else
    echo "image [${image_name}] is exist"
fi

flag=$(docker ps -a | grep ${container_name})
if [ -z "${flag}" ]; then
    cp -rf ./etc/ /

    docker run --name ${container_name} \
        --privileged=true \
        -p 3306:3306 \
        -v /var/lib/mysql:/var/lib/mysql:rw \
        -v /var/log/mysqld.log:/var/log/mysqld.log \
        -v /etc/my.cnf:/etc/my.cnf \
        -v /etc/my.cnf.d/:/etc/my.cnf.d/ \
        -d ${image_name}
else
    echo "container [${container_name}] is exist"
fi

echo "[end]......"
docker images
docker ps -a

