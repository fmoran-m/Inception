#!/bin/sh

FILE=/var/www/html/wp-config.php

if [ -f /var/www/html/wp-config-sample.php ]; then
    mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
fi

sed -i "s/define( 'DB_NAME', 'database_name_here' );/define( 'DB_NAME', '${MDB_DB}' );/g" $FILE
sed -i "s/define( 'DB_USER', 'username_here' );/define( 'DB_USER', '${MDB_USER}' );/g" $FILE
sed -i "s/define( 'DB_PASSWORD', 'password_here' );/define( 'DB_PASSWORD', '${MDB_USER_PASS}' );/g" $FILE
sed -i "s/define( 'DB_HOST', 'localhost' );/define( 'DB_HOST', 'mariadb:3306' );/g" $FILE

cd /var/www/html
if [ ! -f /var/www/html/wp-config.php]; then
    wp core config --dbname=$MDB_DB --dbuser=$MDB_USER --dbpass=$MDB_USER_PASS --dbhost=mariadb:3306
fi

wp core install --url=https://fmoran-m.42.fr --title=Inception --admin_user=$WP_ADMIN --admin_password=$WP_PASS --admin_email=false_mail@gmail.com --skip-email

/usr/sbin/php-fpm82 -F
