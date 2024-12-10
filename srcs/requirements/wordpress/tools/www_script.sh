#!/bin/sh

FILE=/var/www/html/wp-config.php

if [ -f /var/www/html/wp-config-sample.php ]
    mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

sed /define( 'DB_USER', 'username_here' );/define( 'DB_USER', '${MDB_USER}' );/g
sed /define( 'DB_PASSWORD', 'password_here' );/define( 'DB_PASSWORD', '${MDB_USER_PASS}' );/g
sed /define( 'DB_HOST', 'localhost' );/define( 'DB_USER', 'mariadb:3306' );/g

/usr/sbin/php-fpm82 -F
