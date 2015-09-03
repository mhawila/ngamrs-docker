# ngamrs-docker
Docker files to create an environment to run ng-amrs from containers.

To run ng-amrs all images should be built and containers studed.

**To build images follow steps below**

1. Data volume: change to data directory and run
$ docker build -t data .

2. Tomcat image: change to tomcat directory and run
`$ docker build -t openmrs-cors .``

3. ng-amrs app: change to app and run
`$ docker run -t ng-amrs-app .`

*To run without using docker-composer. Starting containers in the following
sequence linking them together.*

1. Run mysql instance mounting data volume
```bash
$ docker run --name mysql -p 3350:3306 -e MYSQL_ROOT_PASSWORD=root \
 --volumes-from data -d mysql:5.6
 ```

2. Run tomcat instance linking to mysql database
`$ docker run -d -p 8888:8080 --link mysql:mysql --name webapp openmrs-cors`

3. Run apache container with link to openmrs web app container
```bash
$ docker run -d --name ng-amrs --link webapp:openmrs-webapp \
-p 9999:80  ng-amrs-app
```

DOCKER COMPOSE
Work in progress.....
