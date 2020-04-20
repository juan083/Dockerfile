#!/bin/bash

echo "[step 1]make directory......"
mkdir -p /etc/php-fpm.d/
mkdir -p /etc/php.d/

还差一个日志的路径

chmod -R 777 /etc/php-fpm.d/
chmod -R 777 /etc/php.d/


echo "[step 2]docker build image......"
docker build -t php72-centos7 .

echo "[step 3]docker run container......"
docker run --name php72  \
-p 9000:9000 \
-v /etc/php-fpm.d/:/etc/php-fpm.d/:rw \
-v /etc/php.d/:/etc/php.d/:rw \



-d php72-centos7

echo "[end]......"
docker images
docker ps -a
