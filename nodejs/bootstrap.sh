#!/bin/sh

die() { echo "ERROR: $1. Aborting!"; exit 1; }

# install dependencies
yum upgrade -y || die "failed to update yum."

# install node.js + npm
yum install npm --enablerepo=epel -y || die "failed to install Node."