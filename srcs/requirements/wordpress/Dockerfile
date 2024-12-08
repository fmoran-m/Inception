FROM alpine:3.19

#Add php
RUN apk upgrade && apk update && apk add php-fpm

#Add tools for wordpress kit
RUN apk add wget zip

#Add WP Zip
RUN wget https://es.wordpress.org/latest-es_ES.zip

#Unzip and remove
RUN unzip latest-es_ES.zip && rm -rf latest-es_ES.zip

#Move folders
RUN mv wordpress/ html/ && mkdir /var/www/ && mv html/ var/www/

#Permissions
RUN chmod -R 755 var/www/html

EXPOSE 9000

ENTRYPOINT ["tail", "-f", "/dev/null"]
