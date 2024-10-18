#!/bin/sh

## install python packages and add libraries

date
apt-get update
# text based web browser
apt-get -y install elinks elinks-data elinks-doc lynx  wget curl w3m
apt-get -y install ldap-utils ldapvi   ldb-tools 
apt-get -y install firefox xterm
apt-get -y install gcc make 

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


# cd /
