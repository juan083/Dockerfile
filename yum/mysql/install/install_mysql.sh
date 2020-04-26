#!/bin/bash

image_name="mysql8-mini-centos7"
container_name="mysql8-mini"
log_path="/var/log/mysql.log"
touch ${log_path}
chmod 777 ${log_path}

flag=$(docker images | grep -w ${image_name})
if [ -z "${flag}" ]; then
    docker build -t ${image_name} .
else
    echo "image [${image_name}] is exist"
fi

flag=$(docker ps -a | grep -w ${container_name})
if [ -z "${flag}" ]; then
    cp -rf ./etc/ /

    docker run --name ${container_name} \
        --privileged=true \
        -p 3306:3306 \
        -v /var/log/mysqld.log:/var/log/mysqld.log \
        -d ${image_name}
else
    echo "container [${container_name}] is exist"
fi

echo "[end]......"
docker images
docker ps -a

