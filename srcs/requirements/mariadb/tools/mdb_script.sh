#!/bin/sh

mysqld --datadir=/var/lib/mysql --user=root &

MYSQL_PID=$!

until mysqladmin ping --silent; do
    sleep 2
done

mysql -u root -e "CREATE DATABASE ${MDB_DB}"
mysql -u root -e "CREATE USER '${MDB_USER}'@'%' IDENTIFIED BY '${MDB_USER_PASS}';"
mysql -u root -e "GRANT ALL PRIVILEGES ON ${MDB_DB}.* TO '${MDB_USER}'@'%';"
mysql -u root -e "FLUSH PRIVILEGES;"

kill $MYSQL_PID

exec mysqld --datadir=/var/lib/mysql --user=root
