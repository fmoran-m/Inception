FROM alpine:3.19

RUN apk upgrade && apk update && apk add mariadb && apk add mysql && apk add mysql-client
RUN mkdir -p /var/lib/mysql && chown -R mysql:mysql /var/lib/mysql
RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld
RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

EXPOSE 3306

COPY tools/mdb_script.sh /mdb_script.sh

RUN chmod 777 mdb_script.sh

CMD ["/mdb_script.sh"]
