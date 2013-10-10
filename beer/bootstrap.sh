#!/bin/sh

die() { echo "ERROR: $1. Aborting!"; exit 1; }

# install dependencies
yum install -y git
easy_install Flask-SQLAlchemy==1.0 || die "Failed to install Flask-SQLAlchemy."
easy_install Flask-OpenID==1.1.1 || die "Failed to install Flask-OpenID."

# stop services
service nginx stop || die "Failed to stop nginx service."
service uwsgi stop || die "Failed to stop uWSGI service."

# install the lastest code
rm -rf /usr/local/src/beer
git clone https://d5dev@bitbucket.org/d5dev/beer.git /usr/local/src/beer || die "Failed to get the code."

# configure
cp -f /usr/local/src/beer/deploy/uwsgi.yaml /etc/uwsgi.yaml
# configure
cp -f /usr/local/src/beer/deploy/prod.conf.py /etc/beer.conf.py
export BEER_CONFIG_FILE=/etc/beer.conf.py

# start services
service uwsgi start || die "Failed to start uWSGI service."
service nginx start || die "Failed to start nginx service."




