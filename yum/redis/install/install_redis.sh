#!/bin/bash

echo "[step 1]make directory......"
mkdir -p /etc/redis/

还差一个日志的路径

chmod -R 777 /etc/redis/



echo "[step 2]docker build image......"
docker build -t redis5-centos7 .

echo "[step 3]docker run container......"
docker run --name redis5  \
-p 6379:6379 \
-p 6380:6380 \
-v /etc/redis/:/etc/redis/:ro \
-v /usr/local/redis:/usr/local/redis \
-d redis5-centos7

echo "[end]......"
docker images
docker ps -a
