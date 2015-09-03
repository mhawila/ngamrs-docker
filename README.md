# ngamrs-docker
Docker files to create an environment to run ng-amrs from containers.

To run ng-amrs all images should be built and containers studed.

**To build images follow steps below**

+ Data volume: change to data directory and run
```bash
$ docker build -t data .
```

+ Tomcat image: change to tomcat directory and run
```bash
$ docker build -t openmrs-cors .
```

+ ng-amrs app: change to app and run
```bash
$ docker run -t ng-amrs-app .
```

*To run without using docker-composer. Starting containers in the following
sequence linking them together.*

+ Run mysql instance mounting data volume
```bash
$ docker run --name mysql -p 3350:3306 -e MYSQL_ROOT_PASSWORD=root \
 --volumes-from data -d mysql:5.6
 ```

+ Run tomcat instance linking to mysql database
```bash
$ docker run -d -p 8888:8080 --link mysql:mysql --name webapp openmrs-cors
```

+ Run apache container with link to openmrs web app container
```bash
$ docker run -d --name ng-amrs --link webapp:openmrs-webapp \
-p 9999:80  ng-amrs-app
```

DOCKER COMPOSE
Work in progress.....
