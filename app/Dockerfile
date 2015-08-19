FROM php:5.6-apache

#Copy a script tha will be copying data

RUN mkdir /var/www/scripts
COPY ./rebuild.sh /var/www/scripts/
COPY ./rebuild.php /var/www/html/rebuild.php

# Install git, grunt, npm, bower and nodejs
RUN apt-get update && apt-get -y install software-properties-common
RUN add-apt-repository ppa:chris-lea/node.js
RUN apt-get update && apt-get install -y git nodejs && \
RUN npm install -g npm; npm install -g grunt-cli; npm install -g bower 


