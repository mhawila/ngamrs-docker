#!/bin/sh

WORKDIR=/opt/work
WEBDIR=/var/www/html/ng-amrs
gitUrl=https://github.com/AMPATH/ng-amrs.git
branch=master

[ ! -d $WORKDIR ] && mkdir -p $WORKDIR


if [ ! -d $WORKDIR/ng-amrs ]; then
	#pull the code from AMPATH repo
	cd $WORKDIR
	git clone $gitUrl && cd $WORKDIR/ng-amrs
	git checkout -b $branch && git pull $gitUrl $branch
else 	
	cd $WORKDIR/ng-amrs
	git checkout $branch || git checkout -b $branch
	git pull $gitUrl $branch
fi

[ $? -ne 0 ] && exit 1

# Change to project's directory 
cd $WORKDIR/ng-amrs

npm install && bower install && grunt build

[ $? -ne 0 ] && exit 2

# Copy files to app if successful.
# suspend the app
service apache2 stop

[ ! -d $WEBDIR ] && mkdir -p $WEBDIR

rm -rf $WEBDIR/*

cp -r dist/* $WEBDIR

service apache2 restart

# write to apache2 log
echo "ng-amrs rebuilt #${build_number} at `date`" >> /var/log/apache2/apache2.log
