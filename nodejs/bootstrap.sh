#!/bin/sh

die() { echo "ERROR: $1. Aborting!"; exit 1; }

# install dependencies
yum upgrade -y || die "failed to update yum."

# add EPEL repo
curl -O http://download-i2.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm || die "failed to add EPEL repo."
rpm -ivh epel-release-6-8.noarch.rpm || die "failed to install EPEL repo."

# install node.js + npm
yum install npm --enablerepo=epel || die "failed to install Node."