#!/bin/bash

mysql() {
    docker pull juan083/mysql8-mini-centos7
    cp -rf ../mysql/etc/ /
    docker-compose -f mysql8.yml up -d mysql8
}

nginx() {
    docker pull juan083/nginx1.16-centos7
    cp -rf ../nginx/etc/ /
    docker-compose -f nginx1.16.yml up -d nginx1.16
}

php() {
    docker pull juan083/php72-centos7
    cp -rf ../php/etc/ /
    docker-compose -f php72.yml up -d php72
}

redis() {
    docker pull juan083/redis5-centos7
    cp -rf ../redis/etc/ /
    docker-compose -f redis5.yml up -d redis5
}

if [[ ${1} == 'mysql' ]]; then
    mysql
fi

if [[ ${1} == 'nginx' ]]; then
    nginx
fi

if [[ ${1} == 'php' ]]; then
    php
fi

if [[ ${1} == 'redis' ]]; then
    redis
fi
