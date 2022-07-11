FROM ubuntu:20.04

RUN apt-get update && \
 apt-get -y install apache2

COPY  /index.html /var/www/html/index.html
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
EXPOSE 80
