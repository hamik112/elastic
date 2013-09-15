sudo yum update -y
sudo yum install -y gcc-c++ libxml2-python libxml2-devel python-devel
sudo easy_install uwsgi==1.9.16
sudo easy_install Flask==0.10.1
sudo yum install -y nginx-1.2.9
sudo rm /etc/nginx/nginx.conf
cd && rm -f uwsgi-nginx.conf && sudo wget https://raw.github.com/d5/elastic/master/uwsgi-nginx.conf && sudo mv uwsgi-nginx.conf /etc/nginx/nginx.conf
sudo service nginx start
sudo chkconfig nginx on