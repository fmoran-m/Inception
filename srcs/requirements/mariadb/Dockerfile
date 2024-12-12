FROM alpine:3.20

RUN apk update && apk add mariadb mariadb-client mariadb-server-utils
RUN mkdir -p /var/lib/mysql && chown -R mysql:mysql /var/lib/mysql
RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld
RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

EXPOSE 3306

COPY ./conf/my.cfn /etc/my.cfn
RUN chmod 755 /etc/my.cfn

COPY tools/mdb_script.sh /mdb_script.sh

RUN chmod 775 mdb_script.sh

CMD ["/mdb_script.sh"]
