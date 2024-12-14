FROM alpine:3.20

#Add php
#Add tools for wordpress kit
RUN apk update && apk add zip wget php82 php82-cli php82-fpm php82-cgi php82-mysqli php82-phar php82-iconv mariadb-client

#Add WP Zip
RUN wget https://es.wordpress.org/latest-es_ES.zip
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar
RUN ln -sf /usr/bin/php82 /usr/bin/php
RUN mv wp-cli.phar /usr/local/bin/wp && wp cli update

#Unzip and remove
RUN unzip latest-es_ES.zip && rm -rf latest-es_ES.zip

#Move folders
RUN mv wordpress/ html/ && mkdir /var/www/ && mv html/ var/www/

#Permissions
RUN chmod -R 755 var/www/html

EXPOSE 9000

COPY ./conf/www.conf /etc/php82/php-fpm.d/www.conf
COPY /tools/www_script.sh /www_script.sh

RUN chmod 755 www_script.sh

CMD ["/www_script.sh"]
