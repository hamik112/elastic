# Nginx-uWSGI

To bootstrap the node with [Nginx](http://wiki.nginx.org/) + [uWSGI](http://projects.unbit.it/uwsgi/) + [Flask](http://flask.pocoo.org), run:

```
curl -L https://raw.github.com/d5/elastic/master/nginx-uwsgi/nginx-uwsgi-flask-bootstrap.sh | sudo sh
```

To bootstrap the node with [Nginx](http://wiki.nginx.org/) + [uWSGI](http://projects.unbit.it/uwsgi/) + [Django](https://www.djangoproject.com), run:

```
curl -L https://raw.github.com/d5/elastic/master/nginx-uwsgi/nginx-uwsgi-django-bootstrap.sh | sudo sh
```

## What it does

* Install [Nginx](http://wiki.nginx.org/), [uWSGI](http://projects.unbit.it/uwsgi/), and [Flask](http://flask.pocoo.org)/[Django](https://www.djangoproject.com) and set up as services.
* Set up a sample application
    * Flask
        * Source: /usr/local/src/flask-helloworld
        * uWSGI config: /etc/uwsgi.yaml
    * Django
        * Source: /usr/local/src/django-helloworld
        * uWSGI config: /etc/uwsgi.yaml
* Other files
    * Nginx config: /etc/nginx/nginx.conf

## Services

To start or stop Nginx:

```
sudo service nginx start/stop
```

To start or stop uWSGI:

```
sudo service uwsgi start/stop
```
Both Nginx and uWSGI are automatically re-started when the node gets rebooted.

## Versions

* Nginx 1.2.9
* uWSGI 1.9.16
* Django 1.5.4
* Flask 0.10.1

## Tested EC2 images

* Amazon Linux AMI x86_64 PV EBS - amzn-ami-pv-2013.03.1.x86_64-ebs (ami-0358ce33)
