if [ `whoami` != "root" ] ; then
	echo "You must run this script as root. Sorry!"
	exit 1
fi

die () {
	echo "ERROR: $1. Aborting!" 
	exit 1
}

yum upgrade -y || die "Failed to update yum."
yum install -y gcc-c++ libxml2-python libxml2-devel python-devel git || die "Failed to install required software."
easy_install uwsgi==1.9.16 || die "Failed to install uWSGI."
easy_install Flask==0.10.1 || die "Failed to install Flask."
easy_install Flask-OpenID==1.1.1 || die "Failed to install Flask-OpenID."
easy_install hiredis==0.1.1 || die "Failed to install Hiredis."
easy_install redis==2.8.0 || die "Failed to install redis-py."
yum install -y nginx-1.2.9 || die "Failed to install nginx."
curl -L https://raw.github.com/d5/elastic/master/uwsgi_params > /etc/nginx/uwsgi_params || die "Failed to copy uwsgi_params."
curl -L https://raw.github.com/d5/elastic/master/nginx-uwsgi.conf > /etc/nginx/nginx.conf || die "Failed to update nginx config."
chkconfig nginx on
service nginx start || die "Failed to start nginx service."

SRC_PATH=/usr/local/src/beer
rm -rf $SRC_PATH
git clone https://d5dev@bitbucket.org/d5dev/beer.git $SRC_PATH || die "Failed to get the code."

curl -L https://raw.github.com/d5/elastic/master/uwsgi-initd > /etc/init.d/uwsgi || die "Failed to install uwsgi init.d."
chmod +x /etc/init.d/uwsgi

chkconfig uwsgi on
service uwsgi start || die "Failed to start uWSGI."



