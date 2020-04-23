#!/bin/bash
set -e
DATADIR='/var/lib/mysql'
if [ ! -d "$DATADIR/mysql" ]; then
	mkdir -p "$DATADIR"
	chown -R mysql:mysql "$DATADIR"
    mysqld --initialize-insecure
    mysqld --initialize --user=mysql --datadir=${DATADIR} >> /var/log/mysqld.log
fi
mysqld -d >>/var/log/mysqld.log
