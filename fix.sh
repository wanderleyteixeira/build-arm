#!/bin/bash

#
# Update configuration files based on:
# mysql: http://linksysinfo.org/index.php?threads/compilation-error-for-mysql.71247/#post-260895
# ipset: http://www.linksysinfo.org/index.php?threads/docker-build-environment-for-tomatousb-shibby.71119/#post-262369
#

echo 'Updating dnscrypt'
cd $HOME/tomato-make/release/src-rt-6.x.4708/router/dnscrypt/
autoreconf -i

echo 'Updating ipsec'
cd $HOME/tomato-make/release/src-rt-6.x.4708/router/ipset/
autoreconf -i
libtoolize
automake --add-missing

echo 'Backing up mysql configure* files'
cp $HOME/tomato-make/release/src-rt-6.x.4708/router/mysql/configure $HOME/tomato-make/release/src-rt-6.x.4708/router/mysql/configure.back
cp $HOME/tomato-make/release/src-rt-6.x.4708/router/mysql/configure.in $HOME/tomato-make/release/src-rt-6.x.4708/router/mysql/configure.in.back

echo 'Replacing configure* files'
#cp -p /var/tmp/configure.new $HOME/tomato-make/release/src-rt-6.x.4708/router/mysql/configure
cp -p /var/tmp/configure.in.new $HOME/tomato-make/release/src-rt-6.x.4708/router/mysql/configure.in

echo 'Updating mysql configuration'
cd $HOME/tomato-make/release/src-rt-6.x.4708/router/mysql/
libtoolize --force
aclocal
autoheader
automake --force-missing --add-missing
autoconf

echo 'Updating pcre'
cd $HOME/tomato-make/release/src-rt-6.x.4708/router/pcre
autoreconf -i

echo 'Update completed'
echo ''
