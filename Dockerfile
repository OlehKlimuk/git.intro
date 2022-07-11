# Pull the minimal Ubuntu image
FROM ubuntu

# Install Nginx
RUN apt-get -y update && apt-get -y install nginx

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Copy the Nginx config
COPY index.html /etc/nginx/sites-available/index.html

# Expose the port for access
EXPOSE 80/tcp

# Run the Nginx server
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
