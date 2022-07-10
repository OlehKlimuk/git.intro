FROM ubuntu:20.04
ENV TZ=Europe/Kiev
RUN apt-get -y update
RUN DEBIAN_FRONTEND="noninteractive"\
  apt-get -y install apache2
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf 
COPY . /var/www/html/


CMD ["/usr/sbin/apache2ctl","-DFOREGROUND"]
EXPOSE 80
