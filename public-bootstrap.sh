#!/bin/sh
#Passing the first agumnet i.e $1 as the s3 path format 's3://{bucketname}/{object-key}'. e.g.  

#Download S3cmd and extract
curl -L http://github.com/s3tools/s3cmd/archive/v1.5.0-alpha3.zip -o /tmp/s3cmd.zip
unzip /tmp/s3cmd.zip -d /tmp/
#rm /tmp/s3cmd.zip -f

#Download Private Bootstrap package.
/tmp/s3cmd-1.5.0-alpha3/s3cmd get $1 /tmp/bootstrap.zip
unzip /tmp/bootstrap.zip -d /tmp/private-bootstrap/
#rm /tmp/bootstrap.zip -f

#Execute the private Linux Bootstrap
/tmp/private-bootstrap/scripts/linux-bootstrap.sh

#Tidy up & Remove files '/tmp/s3cmd-1.5.0-alpha3/' & '/tmp/private-bootstrap/'
#rm -rf /tmp/private-bootstrap/
#rm -rf /tmp/s3cmd-1.5.0-alpha3/
