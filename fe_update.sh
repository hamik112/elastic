if [ `whoami` != "root" ] ; then
	echo "You must run this script as root. Sorry!"
	exit 1
fi

die () {
	echo "ERROR: $1. Aborting!" 
	exit 1
}

service nginx stop || die "Failed to stop nginx service."
service uwsgi stop || die "Failed to stop uWSGI service."

rm -rf /usr/local/src/beer
git clone https://d5dev@bitbucket.org/d5dev/beer.git /usr/local/src/beer || die "Failed to get the code."

service uwsgi start || die "Failed to start uWSGI service."
service nginx start || die "Failed to start nginx service."


