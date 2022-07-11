FROM php:7.0-apache
COPY ./index.html /var/www/html/

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]
EXPOSE 80
