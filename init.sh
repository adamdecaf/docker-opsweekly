#!/bin/bash

echo "Starting mysql in the background"
/entrypoint.sh mysqld > /var/log/mysql-entrypoint.log &
sleep 10

echo "starting apache"
/etc/init.d/apache2 start

echo "Setting up mysql databases"
mysql --password=$MYSQL_ROOT_PASSWORD -e 'create database opsweekly;'
mysql --password=$MYSQL_ROOT_PASSWORD -e "grant all on opsweekly.* to opsweekly_user@localhost IDENTIFIED BY '$OPSWEEKLY_MYSQL_PASSWORD';";
mysql -u opsweekly_user --password=$OPSWEEKLY_MYSQL_PASSWORD opsweekly < /opt/opsweekly/opsweekly.sql

exec /bin/bash
