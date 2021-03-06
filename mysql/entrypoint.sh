#!/bin/bash
set -e
DATADIR='/var/lib/mysql'
LOGDIR='/var/log/mysqld.log'
if [[ ! -d "$DATADIR/mysql" ]]; then
    rm -rf ${DATADIR}
    mkdir -p "$DATADIR"
    chown -R mysql:mysql "$DATADIR"
    mysqld --initialize-insecure --user=mysql --datadir=${DATADIR} >> ${LOGDIR}
fi
mysqld --user mysql >> ${LOGDIR}
