#!/bin/sh

# Redis 2.6.16

REDIS_VER=2.6.16
REDIS_PORT=6379

die() { echo "ERROR: $1. Aborting!"; exit 1; }

if [ `whoami` != "root" ] ; then
	die "You must be root to run this."
fi

# install required
yum upgrade -y || die "Failed to update yum."
yum install -y gcc gcc-c++ make || die "Failed to install required software."

# install Redis
DEST_DIR=/usr/local/src
REDIS_DIR=$DEST_DIR/redis-$REDIS_VER
mkdir -p $DEST_DIR
wget -P $DEST_DIR http://download.redis.io/releases/redis-$REDIS_VER.tar.gz
tar xzf $DEST_DIR/redis-$REDIS_VER.tar.gz -C $DEST_DIR
make -C $REDIS_DIR install || die "Failed to build and install Redis."

# make Redis as a service
mkdir -p /etc/redis
mkdir -p /var/redis
curl -L https://raw.github.com/d5/elastic/master/redis/redis-initd > /etc/init.d/redis || die "Failed to setup init.d."
curl -L https://raw.github.com/d5/elastic/master/redis/redis.conf > /etc/redis/$REDIS_PORT.conf || die "Failed to install reids.conf."
mkdir -p /var/redis/$REDIS_PORT