#!/bin/bash

cp -rf ./etc/ /etc/

image_name=`docker images | grep "nginx1.16-centos7" | awk '{print $1}'`
if [ ! -n "$image_name" ]; then
    docker build -t nginx1.16-centos7 .
fi

cp -rf ./etc/ /etc

docker run --name nginx1.16  \
--privileged=true \
-p 80:80 \
-p 90:90 \
-p 443:443 \
-p 8080:8080 \
-v /var/www/:/var/www/ \
-v /var/log/nginx/:/var/log/nginx/ \
-v /etc/nginx/:/etc/nginx/:ro \
-d nginx1.16-centos7

echo "[end]......"
docker images
docker ps -a
