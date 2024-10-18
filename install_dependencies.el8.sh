#!/bin/sh

## install python packages and add libraries

date
yum install update
# text based web browser
yum install -y elinks elinks-data elinks-doc lynx  wget curl w3m
yum install -y ldap-utils ldapvi   ldb-tools 
yum install -y epel-release
yum install -y firefox xterm xauth
yum install -y gcc make autoconf  which 
yum install -y gcc make autoconf  which 
yum install -y iotop htop atop  btop  numatop  iftop 
yum install -y nvtop 
yum install -y stress

# TBD smc, dell ipmitool...
# wget to them maybe behind login requirements

echo "==================================="

# perhaps tmp only, atlas need to invoke docker, so this maybe helpful
#xx old do not use  yum install -y install docker-compose
# https://docs.docker.com/engine/install/ubuntu/
# Add Docker's official GPG key:
yum install -y ca-certificates 
install -m 0755 -d /etc/apt/keyrings


echo "==================================="
echo "==================================="


# cd /
