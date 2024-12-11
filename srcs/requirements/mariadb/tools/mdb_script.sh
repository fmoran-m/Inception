#!/bin/sh

rm -f /etc/my.cnf
touch /tmp/init_file && chmod 777 /tmp/init_file

echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MDB_ROOT_PASS}';" >> /tmp/init_file
echo "CREATE DATABASE IF NOT EXISTS ${MDB_DB};" >> /tmp/init_file
echo "CREATE USER IF NOT EXISTS '${MDB_USER}'@'%' IDENTIFIED BY '${MDB_USER_PASS}';" >> /tmp/init_file
echo "GRANT ALL PRIVILEGES ON ${MDB_DB}.* TO '${MDB_USER}'@'%';" >> /tmp/init_file
echo "FLUSH PRIVILEGES;" >> /tmp/init_file

exec mysqld --datadir=/var/lib/mysql --user=root --init-file=/tmp/init_file
