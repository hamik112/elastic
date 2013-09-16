# Redis

To bootstrap the node with [Redis](http://redio.io/), run:

```
curl -L https://raw.github.com/d5/elastic/master/redis/redis-bootstrap.sh | sudo sh
```

## What it does

* Install [Redis](http://redio.io/) and set up as services.

## Services

To start or stop Redis:

```
sudo service redis start/stop
```

Redis server is automatically re-started when the node gets rebooted.

## Versions

* Redis 2.6.16

## Tested EC2 images

* Amazon Linux AMI x86_64 PV EBS - amzn-ami-pv-2013.03.1.x86_64-ebs (ami-0358ce33)
