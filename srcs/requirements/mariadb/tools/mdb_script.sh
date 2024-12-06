#!/bin/sh

mysql -u root -e "ALTER USER 'root'@'%' IDENTIFIED BY '${MDB_ROOT_PASS}';"
mysql -u root -e "CREATE DATABASE IF NOT EXISTS '${MDB_DB}';"
mysql -u root -e "CREATE USER IF NOT EXISTS '${MDB_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -u root -e "GRANT ALL PRIVILEGES ON '${MDB_DB}'.* TO '${MDB_USER}'@'%';"
mysql -u root -e "FLUSH PRIVILEGES;"

mysqld --datadir=/var/lib/mysql --user=root
