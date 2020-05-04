#!/bin/bash

path=$(pwd)
cd ${path}/redis/
sh ./install_redis.sh $1

cd ${path}/php/
sh ./install_php.sh $1

cd ${path}/nginx/
sh ./install_nginx.sh $1

cd ${path}/mysql/
sh ./install_mysql.sh $1
