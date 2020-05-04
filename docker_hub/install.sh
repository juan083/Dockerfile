#!/bin/bash

mysql() {
    docker pull juan083/mysql8-mini-centos7:1.0
    cp -rf ../mysql/etc/ /
    docker-compose -f docker_hub_lnmpr.yml up -d mysql8
}

nginx() {
    docker pull juan083/nginx1.16-centos7:1.0
    cp -rf ../nginx/etc/ /
    docker-compose -f docker_hub_lnmpr.yml up -d nginx1.16
}

php() {
    docker pull juan083/php72-centos7:1.0
    cp -rf ../php/etc/ /
    docker-compose -f docker_hub_lnmpr.yml up -d php72
}

redis() {
    docker pull juan083/redis5-centos7:1.0
    cp -rf ../redis/etc/ /
    docker-compose -f docker_hub_lnmpr.yml up -d redis5
}

if [[ ${1} == 'mysql' ]]; then
    echo "mysql start..."
    mysql
fi

if [[ ${1} == 'nginx' ]]; then
    echo "nginx start..."
    nginx
fi

if [[ ${1} == 'php' ]]; then
    echo "php start..."
    php
fi

if [[ ${1} == 'redis' ]]; then
    echo "redis start..."
    redis
fi

echo "success"
