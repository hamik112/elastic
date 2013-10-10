# Service Deploy

# Bootstrapping

To bootstrap the front-end nodes, run:

```
curl -L https://raw.github.com/d5/elastic/master/nginx-uwsgi/nginx-uwsgi-flask-bootstrap.sh | sudo sh
curl -L https://raw.github.com/d5/elastic/master/beer/bootstrap.sh | sudo sh
```

## Tested EC2 images

* Amazon Linux AMI x86_64 PV EBS - amzn-ami-pv-2013.03.1.x86_64-ebs (ami-0358ce33)