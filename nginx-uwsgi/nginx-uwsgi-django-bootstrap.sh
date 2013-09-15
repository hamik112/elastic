#!/bin/sh

# Dependencies:
#	nginx 1.2.9
#	uwsgi 1.9.16
#	Django 1.5.4

die() { echo "ERROR: $1. Aborting!"; exit 1; }

if [ `whoami` != "root" ] ; then
	die "You must be root to run this."
fi

# install required
yum upgrade -y || die "Failed to update yum."
yum install -y gcc-c++ libxml2-python libxml2-devel python-devel || die "Failed to install required software."

# try stopping services
service nginx stop 2> /dev/null
service uwsgi stop 2> /dev/null

# install Django and an example Django app
SAMPLE_SRC_PATH=/usr/local/src/django-helloworld
easy_install Django==1.5.4 || die "Failed to install Django."
curl -L https://raw.github.com/d5/elastic/master/nginx-uwsgi/nginx-uwsgi-django.yaml > /etc/uwsgi.yaml || die "Failed to install uWSGI config file."
rm -rf $SAMPLE_SRC_PATH 
mkdir -p $SAMPLE_SRC_PATH
django-admin.py startproject helloworld $SAMPLE_SRC_PATH

# config & start nginx 
yum install -y nginx-1.2.9 || die "Failed to install nginx."
curl -L https://raw.github.com/d5/elastic/master/nginx-uwsgi/nginx-uwsgi.conf > /etc/nginx/nginx.conf || die "Failed to update nginx config."
chkconfig nginx on
service nginx start || die "Failed to start nginx service."

# config & start uWSGI
easy_install uwsgi==1.9.16 || die "Failed to install uWSGI."
curl -L https://raw.github.com/d5/elastic/master/nginx-uwsgi/nginx-uwsgi-initd > /etc/init.d/uwsgi || die "Failed to set up uWSGI service."
chmod +x /etc/init.d/uwsgi
chkconfig uwsgi on
service uwsgi start || die "Failed to start uWSGI service."