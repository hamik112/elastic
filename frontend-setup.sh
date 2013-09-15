#check for root user TODO: replace this with a call to "id"
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
easy_install uwsgi==1.9.16 || die "Failed to install UWSGI."
easy_install Flask==0.10.1 || die "Failed to install Flask."
yum install -y nginx-1.2.9 || die "Failed to install nginx."
curl -L https://raw.github.com/d5/elastic/master/uwsgi_params > /etc/nginx/uwsgi_params || die "Failed to copy uwsgi_params."
curl -L https://raw.github.com/d5/elastic/master/nginx-uwsgi.conf > /etc/nginx/nginx.conf || die "Failed to update nginx config."
chkconfig nginx on
service nginx start || die "Failed to start nginx service."

git clone https://d5dev@bitbucket.org/d5dev/beer.git /usr/local/src/beer || die "Failed to get the code."
mkdir -p /etc/uwsgi
cp /usr/local/src/beer/app.yaml /etc/uwsgi/beer.yaml
curl -L https://raw.github.com/d5/elastic/master/etc-init-uwsgi.conf > /etc/init/uwsgi.conf || die "Failed to set up uWSGI init."


