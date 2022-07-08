FROM ubuntu:20.04

RUN apt-get update && \
 apt-get -y install apache2

COPY  /index.html /var/www/html/index.html



EXPOSE 80
