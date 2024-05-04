#!/bin/sh

## install python packages and add libraries

date
yum install update
# text based web browser
yum install -y install elinks elinks-data elinks-doc lynx  wget curl w3m
yum install -y install ldap-utils ldapvi   ldb-tools 
yum install -y install firefox xterm

# TBD smc, dell ipmitool...
# wget to them maybe behind login requirements

echo "==================================="

# perhaps tmp only, atlas need to invoke docker, so this maybe helpful
#xx old do not use  yum install -y install docker-compose
# https://docs.docker.com/engine/install/ubuntu/
# Add Docker's official GPG key:
yum install -y install ca-certificates 
install -m 0755 -d /etc/apt/keyrings


echo "==================================="
echo "==================================="


# cd /
