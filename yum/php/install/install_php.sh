#!/bin/bash

cp -rf ./etc/ /etc/

docker build -t php72-centos7 ../

docker run --name php72 \
-p 9000:9000 \
-v /etc/php.int:/etc/php.int:ro \
-v /etc/php.d/:/etc/php.d/:ro \
-v //etc/php-fpm.conf:/etc/php-fpm.conf:ro \
-v /etc/php-fpm.d/:/etc/php-fpm.d/:ro \
-v /var/log/php-fpm/:/var/log/php-fpm/ \
-d php72-centos7

docker images
docker ps -a
