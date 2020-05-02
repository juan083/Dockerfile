#!/bin/bash
set -e
nginx -g "daemon off;" >> /var/log/nginx/start.log
