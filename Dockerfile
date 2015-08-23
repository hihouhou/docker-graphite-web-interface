#
# Graphite-web server Dockerfile
#
# https://github.com/
#

# Pull base image.
FROM debian:latest

MAINTAINER hihouhou < hihouhou@hihouhou.com >

# Update & install packages for graphite
RUN apt-get update && \
    apt-get install -y apache2 libapache2-mod-wsgi graphite-web

#Disable default conf for apache2
RUN a2dissite 000-default

#Configure apache2-graphite.conf
ADD apache2-graphite.conf /etc/apache2/sites-available/
RUN a2ensite apache2-graphite

EXPOSE 80

CMD ["apache2ctl", "-D", "FOREGROUND"]
