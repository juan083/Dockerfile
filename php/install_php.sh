#!/bin/bash
image_name="php72-centos7"
container_name="php72"

flag=$(docker images | grep ${image_name})
if [[ -z "${flag}" ]]; then
    docker build -t ${image_name} .
else
	echo "image [${image_name}] is exist"
fi

flag=$(docker ps -a | grep ${container_name})
if [[ -z "${flag}" ]]; then
    if [[ ${1} == 1 ]]; then
    	cp -rf ./etc/ /
    	docker run --name ${container_name} \
            -p 9000:9000 \
            -v /etc/php.ini:/etc/php.ini:ro \
            -v /etc/php.d/:/etc/php.d/:ro \
            -v //etc/php-fpm.conf:/etc/php-fpm.conf:ro \
            -v /etc/php-fpm.d/:/etc/php-fpm.d/:ro \
            -v /var/log/php-fpm/:/var/log/php-fpm/ \
            -v /var/www/:/var/www/ \
            -d ${image_name}
    else
        echo "do not create [${container_name}]"
    fi
else
    echo "container [${container_name}] is exist"
fi

echo "[end]......"
docker images
docker ps -a
