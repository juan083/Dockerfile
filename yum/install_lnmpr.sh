#!/bin/bash

cd ./redis/install
sh ./install_redis.sh

cd ./php/install
sh ./install_php.sh

cd ./nginx/install
sh ./install_nginx.sh

cd ./mysql/install
sh ./install_mysql.sh

