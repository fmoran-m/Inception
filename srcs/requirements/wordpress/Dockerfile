FROM alpine:3.20

#Add php
#Add tools for wordpress kit
RUN apk update && apk add wget zip php82 php82-fpm php82-cgi

#Add WP Zip
RUN wget https://es.wordpress.org/latest-es_ES.zip

#Unzip and remove
RUN unzip latest-es_ES.zip && rm -rf latest-es_ES.zip

#Move folders
RUN mv wordpress/ html/ && mkdir /var/www/ && mv html/ var/www/

#Permissions
RUN chmod -R 755 var/www/html

EXPOSE 9000

COPY ./conf/www.conf /etc/php82/php-fpm.d/www.conf

ENTRYPOINT ["/usr/sbin/php-fpm82", "-F"]
