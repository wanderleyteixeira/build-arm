#!/bin/bash

#
# Compile Tomato (Shibby) Firmare for ARM-based routers
# Debian 7.8 (64-bit) - Standard system utilities only
#

readonly cfg="${0%.*}.cfg"

echo 'Add i386 architecture'
sudo dpkg --add-architecture i386

echo 'Update package'
sudo apt-get update

echo 'Sleeping...'
sleep 5

echo 'Install necessary packages'
sudo apt-get install -y `cat $cfg`

echo 'Download and install automake-1.13.2'
cd /home/tomato/
wget http://tomato.groov.pl/download/K26RT-N/testing/automake_1.13.2-1ubuntu1_all.deb
sudo dpkg -i automake_1.13.2-1ubuntu1_all.deb

echo 'Cloning Tomato Shibby-ARM sources into /home/tomato/tomato-arm/'
git clone https://bitbucket.org/pl_shibby/tomato-arm.git

echo 'Copying tomato-arm to tomato-make'
cp -ax /home/tomato/tomato-arm /home/tomato/tomato-make
cd /home/tomato/tomato-make

echo 'Link the toolchains to the git repo (e.g. tomato-make)'
if [ ! -d /opt/hndtools-arm-linux-2.6.36-uclibc-4.5.3 ]; then
    sudo ln -s /home/tomato/tomato-make/release/src-rt-6.x.4708/toolchains/hndtools-arm-linux-2.6.36-uclibc-4.5.3/ /opt/hndtools-arm-linux-2.6.36-uclibc-4.5.3
fi

echo 'Add toolchains to the user profile and source it'
# https://github.com/tonyarnold/tomato-arm-buildbox/blob/master/checkout_advancedtomato_source.sh
hndtools="/home/tomato/tomato-make/release/src-rt-6.x.4708/toolchains/hndtools-arm-linux-2.6.36-uclibc-4.5.3/bin"
if [ -d "$hndtools" ] && [[ ":$PATH:" != *":$hndtools:"* ]]; then
    echo "export PATH=$PATH:$hndtools:/sbin/" >> /home/tomato/.profile
    source /home/tomato/.profile
fi

echo 'Update configuration files for dnscrypt, ipset, mysql, and pcre'
source /home/tomato/.profile
/home/tomato/build-arm/fix.sh
echo ''
echo '================================================='
echo 'Ready to build Tomato ARM on Debian 7.8 (64-bit)'
echo '================================================='
echo ''
echo 'To compile:'
echo 'cd $HOME/tomato-make/release/src-rt-6.x.4708'
echo 'make ac68z V1=WT-RT-AC6x V2=1.0'
echo ''
echo 'After the compile process is done, you will find your router image inside "$HOME/tomato-make/releasesrc-rt-6.x/image"'
echo ''
echo 'Type 'make help' to see the options to build for each model.'
echo 'Run "cd $HOME/tomato-make/release/src-rt-6.x.4708/;git clean -dfx && git checkout" before compiling.'
echo ''
