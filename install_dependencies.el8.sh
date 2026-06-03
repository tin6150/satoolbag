#!/bin/sh

## install python packages and add libraries

date
yum install update
# text based web browser
yum install -y curl   # seems installed by here
yum install -y wget 
yum install -y kernel-devel dkms
yum install -y findutils     # needed by mellanox mdt/mst
yum install -y pciutils      # needed by mellanox mdt/mst   find, xargs
yum install -y systemd-udev  # needed by mellanox mdt/mst   
yum install -y usbutils      # needed by mellanox mdt/mst   
yum install -y epel-release
yum install -y mstflint      # open source versino of mst...

yum install -y ldap-utils ldapvi   ldb-tools 
yum install -y firefox xterm xauth
yum install -y gcc make autoconf  which 
yum install -y iotop htop atop  btop  numatop  iftop 
yum install -y nvtop 
yum install -y stress
yum install -y elinks elinks-data elinks-doc 
yum install -y lynx  w3m

echo "==================================="
echo "=== Install Mellanox mst tool ================================"


mkdir Downloads
cd    Downloads
wget  -q https://www.mellanox.com/downloads/MFT/mft-4.35.0-159-x86_64-rpm.tgz
tar   xfz mft-4.35.0-159-x86_64-rpm.tgz
cd    mft-4.35.0-159-x86_64-rpm/RPMS

yum install -y mft-4.35.0-159.x86_64.rpm
yum install -y mft-autocomplete-4.35.0-159.x86_64.rpm mft-mlx5-4.35.0-159.x86_64.rpm       mft-oem-4.35.0-159.x86_64.rpm mft-nvredfish-4.35.0-159.x86_64.rpm  mft-pcap-4.35.0-159.x86_64.rpm


# https://network.nvidia.com/products/adapter-software/firmware-tools/
# Linux: mft-4.35.0-159-x86_64-rpm.tgz
# MD5SUM: b4d64f9f37fa5ceb052434ec8b76ffcc
# SHA256: df421ef7d0fb1d3bba25e28a17740655fb687387d1ddfdb3944bbcd1c666a385
# Size: 72.52 M



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
