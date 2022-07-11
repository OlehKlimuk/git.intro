FROM httpd:2.4
COPY ./index.html/ /usr/local/apache2/htdocs/
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
EXPOSE 80
