yum update -y
yum install -y gcc-c++ libxml2-python libxml2-devel python-devel
easy_install uwsgi==1.9.16
easy_install Flask==0.10.1
yum install -y nginx-1.2.9
curl -L https://raw.github.com/d5/elastic/master/uwsgi-nginx.conf > /etc/nginx/nginx.conf
service nginx start
chkconfig nginx on
