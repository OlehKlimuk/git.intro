FROM ubuntu:20.04
ENV TZ=Europe/Kiev
RUN apt-get -y update
RUN DEBIAN_FRONTEND="noninteractive"\
  apt-get -y install apache2
RUN systemctl status apache2.service -l --no-pager
COPY  /index.html /var/www/html/index.html

RUN echo '. /etc/apache2/envvars' > /root/run_apache.sh && \
 echo 'mkdir -p /var/run/apache2' >> /root/run_apache.sh && \
 echo 'mkdir -p /var/lock/apache2' >> /root/run_apache.sh && \
 echo '/usr/sbin/apache2 -D FOREGROUND' >> /root/run_apache.sh && \
 chmod 755 /root/run_apache.sh

CMD ["/usr/sbin/apache2ctl","-DFOREGROUND"]
EXPOSE 80
