FROM ubuntu:20.04
ENV TZ=Europe/Kiev
RUN apt-get -y update
RUN DEBIAN_FRONTEND="noninteractive"\
  apt-get -y install apache2
RUN echo 'Servername localhost' >> /etc/apache2/apache2.conf && systemctl reload apache2
COPY  /index.html /var/www/html/index.html


CMD ["/usr/sbin/apache2ctl","-DFOREGROUND"]
EXPOSE 80
