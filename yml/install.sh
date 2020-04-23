#!/bin/bash

# nginx 1.16
docker pull nginx:1.16.1

# mysql 8
docker pull mysql:8.0.19

# php 7.2
docker pull php:7.2.30

# redis 5
docker pull redis:5.0.9

docker-compose -f lnmpr.yml up -d
