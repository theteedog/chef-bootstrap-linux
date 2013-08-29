#!/bin/sh
#Passing the first agumnet i.e $1 as the s3 bucket name.
#Passing the first agumnet i.e $2 as the s3 object Key.

#Download Boto and extract
curl -L https://github.com/boto/boto/archive/2.10.0.tar.gz -o /tmp/boto.tar.gz
cd /tmp/
tar -zxf boto.tar.gz

#Install Boto
cd /tmp/boto-2.10.0/
python setup.py install

#Download Private Bootstrap package.
curl -L https://raw.github.com/theteedog/chef-bootstrap-linux/master/boto-s3-download.py -o /tmp/boto-s3-download.py
python /tmp/boto-s3-download.py -b "$1" -k "$2"
unzip /tmp/private-bootstrap.zip -d /tmp/private-bootstrap/

#Execute the private Linux Bootstrap
chmod +x /tmp/private-bootstrap/scripts/linux-bootstrap.sh
/tmp/private-bootstrap/scripts/linux-bootstrap.sh

