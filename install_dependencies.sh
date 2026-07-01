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

apt-get -y install libwayland-cursor0 libwayland-client0 libwayland-egl1 libxkbcommon0 libxkbcommon-x11-0 libxcb-render0 libxcb-xkb1 libegl1 libgl1


echo "---- install root from caen, no .deb avail yet ---- ref https://root.cern/install/#download-a-pre-compiled-binary-distribution ----" 


mkdir -p /local/root
cd /local
wget --quiet "https://root.cern/download/root_v6.40.02.Linux-almalinux9.8-x86_64-gcc11.5.tar.gz"
tar -xzvf root_v6.40.02.Linux-almalinux9.8-x86_64-gcc11.5.tar.gz




# cd /
