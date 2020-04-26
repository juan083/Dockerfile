#!/bin/bash

path=$(pwd)
cd ${path}/redis/
sh ./install_redis.sh

cd ${path}/php/
sh ./install_php.sh

cd ${path}/nginx/
sh ./install_nginx.sh

cd ${path}/mysql/
sh ./install_mysql.sh
