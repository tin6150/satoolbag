#!/bin/sh

## install python packages and add libraries

date
apt-get update
# text based web browser
apt-get -y install elinks elinks-data elinks-doc lynx  wget curl
apt-get -y install ldap-utils ldapvi   ldb-tools 
apt-get -y install firefox xterm
apt-get -y install wget
apt-get -y install curl

# TBD smc, dell ipmitool...
# wget to them maybe behind login requirements

echo "==================================="

# perhaps tmp only, atlas need to invoke docker, so this maybe helpful
#xx old do not use  apt-get -y install docker-compose
# https://docs.docker.com/engine/install/ubuntu/
# Add Docker's official GPG key:
apt-get -y install ca-certificates 
install -m 0755 -d /etc/apt/keyrings

# Add the repository to Apt sources:
apt-get update

echo "==================================="
echo "==================================="

echo "---- install libs needed by CoMPASS ----"

apt-get -y install git dpkg-dev cmake g++ gcc binutils libx11-dev libxpm-dev libxft-dev libxext-dev
apt-get -y install build-essential
apt-get -y install qt6-base-dev qt6-tools-dev-tools

apt-get -y install libwayland-cursor0 libwayland-client0 libwayland-egl1 libxkbcommon0 libxkbcommon-x11-0 libxcb-render0 libxcb-xkb1 libegl1 libgl1
apt-get -y install libtbb2 libtbb-dev



echo "---- install dependencies for root"
# per https://root.cern/install/dependencies/

apt-get -y install binutils cmake dpkg-dev g++ gcc libssl-dev git libx11-dev libxext-dev libxft-dev libxpm-dev python3 libtbb-dev libvdt-dev libgif-dev
apt-get -y install gfortran libpcre3-dev \
libglu1-mesa-dev libglew-dev libftgl-dev \
libfftw3-dev libcfitsio-dev libgraphviz-dev \
libavahi-compat-libdnssd-dev libldap2-dev \
 python3-dev python3-numpy libxml2-dev libkrb5-dev \
libgsl-dev qtwebengine5-dev nlohmann-json3-dev libmysqlclient-dev \
libgl2ps-dev \
liblzma-dev libxxhash-dev liblz4-dev libzstd-dev libcurl4-openssl-dev



echo "---- install root from caen, no .deb avail yet ---- ref https://root.cern/install/#download-a-pre-compiled-binary-distribution ----" 


mkdir -p /local/root
cd /local
wget --quiet "https://root.cern/download/root_v6.40.02.Linux-almalinux9.8-x86_64-gcc11.5.tar.gz"
ls -latrh
tar xfz  root_v6.40.02.Linux-almalinux9.8-x86_64-gcc11.5.tar.gz

cd root
mkdir builddir
cd builddir
cmake ../root
cmake --build . 

ldconfig # update ldconfig cache, doesn't seems to work out correctly for container
# but still have to manually: source /local/root/bin/thisroot.sh
# so hacking it
##cp -p /local/root/bin/thisroot.*sh /etc/profile.d
## somehow the copy for that doesn't get ROOTSYS var setup, maybe path detection dependent.  
## so doing this nested version instead, which works:
echo "source /local/root/bin/thisroot.sh" > /etc/profile.d/cern_root_env.sh

# cd /
