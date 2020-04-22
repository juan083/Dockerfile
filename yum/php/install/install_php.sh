#!/bin/bash
image_name="php72-centos7"
container_name="php72"

flag=$(docker images | grep ${image_name})
if [ -z "${flag}" ]; then
    docker build -t php72-centos7 .
else
	echo "image [${image_name}] is exist"
fi

flag=$(docker ps -a | grep ${container_name})
if [ -z "${flag}" ]; then
	cp -rf ./etc/ /

	docker run --name php72 \
        -p 9000:9000 \
        -v /etc/php.int:/etc/php.int:ro \
        -v /etc/php.d/:/etc/php.d/:ro \
        -v //etc/php-fpm.conf:/etc/php-fpm.conf:ro \
        -v /etc/php-fpm.d/:/etc/php-fpm.d/:ro \
        -v /var/log/php-fpm/:/var/log/php-fpm/ \
        -d php72-centos7
else
    echo "container [${container_name}] is exist"
fi

echo "[end]......"
docker images
docker ps -a
