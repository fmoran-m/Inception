FROM alpine:3.20

RUN apk update && apk add nginx openssl
RUN mkdir -p /etc/ssl/mycerts
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/ssl/mycerts/server.key -out /etc/ssl/mycerts/server.crt \
	-subj "/C=ES/ST=Madrid/L=Madrid/O=42Madrid/CN=fmoran-m.42.fr"

COPY ./conf/default.conf /etc/nginx/http.d/default.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
