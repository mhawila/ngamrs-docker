#
# To run build the image run; $ docker build -t image-name[:tag] .
# Example: $ docker build -t openmrs-cors:1.0 .
#
# Note: The resulting image is highly dependent on hard coded openmrs database
#       configuration running in mysql container. Hence to run a container based 
#       on the image you also need to have a container named 'mysql' running mysql instance 
#	at port 3306  with openmrs database named 'openmrs' and a database user named openmrs_user
#       with password '6tzej4pn7ODH' having full access to openmrs db from anyhost (i.e. %) 
#
# TODO: Make the database configurable. Until then you will need to use this image with accompanying
#	mysql docker image having a openmrs database already installed.
#
# TO RUN a container (Note using mysql container based on accompanying mysql image)
#      $ docker run -d -p host-port:8080 --link mysql:mysql --name <chosen-name> <image-name>
# Example: $ docker run -d -p 8990:8080 --link mysql:mysql --name webapp openmrs-cors:1.0
#
# Note: To be able to access the webapp mysql container need to be running. To see the webapp, 
#        use http://docker-host-ip:8990/openmrs (username:admin, password:test) 
#
FROM tomcat:7.0.63

MAINTAINER Willa<a.mhawila@gmail.com>

COPY ./openmrs-runtime.properties /root/.OpenMRS/
COPY ./webservices.rest-omod-2.9.omod /root/.OpenMRS/modules/
COPY ./openmrs.war /usr/local/tomcat/webapps/

