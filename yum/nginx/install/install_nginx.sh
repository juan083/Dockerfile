#!/bin/bash
image_name="nginx1.16-centos7"
container_name="nginx1.16"

flag=$(docker images | grep ${image_name})
if [ -z "${flag}" ]; then
	docker build -t nginx1.16-centos7 .
else
	echo "image [${image_name}] is exist"
fi

flag=$(docker ps -a | grep ${container_name})
if [ -z "${flag}" ]; then
	cp -rf ./etc/ /

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
else
    echo "container [${container_name}] is exist"
fi

echo "[end]......"
docker images
docker ps -a
