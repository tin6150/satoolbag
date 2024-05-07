
#!/bin/bash 

# script to 1: enable abilities to install rocm/hip drivers, 2: try to actually install them.
# expect not to find hip-runtime-nvidia, at least not in rocky 8.9, this is mostly to see if avail in el9
# to be called by Dockerfile 


date            | tee    /_install_rocm_hip_sh_
echo "start"    | tee -a /_install_rocm_hip_sh_

# ref https://rocm.docs.amd.com/projects/install-on-linux/en/latest/tutorial/quick-start.html#rocm-install-quick


yum -y update 

wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm
rpm -ivh epel-release-latest-9.noarch.rpm
dnf -y install dnf-plugin-config-manager
crb enable
yum -y install kernel-headers kernel-devel
#sudo usermod -a -G render,video $LOGNAME # Adding current user to Video, Render groups. See prerequisites.
usermod -a -G render,video operator  # just adding a user as place holder
yum -y install https://repo.radeon.com/amdgpu-install/6.1/rhel/9.3/amdgpu-install-6.1.60100-1.el9.noarch.rpm
yum clean all
yum -y install amdgpu-dkms   	# not working for rocky9.3 on 2024.0507
yum -y install rocm		# ditto
#  rocm-hip-runtime rocm-hip-runtime-devel  # would have been included in above in rocky8
echo "Please reboot system for all settings to take effect."


echo "============================================================"

yum -y install hip-devel

yum -y install hip-runtime-nvidia	# not working in rocky8 or 9

# hip-runtime-nvidia has a dependency that can't currently be satisfied:
# hipcc-nvidia
#yum install hip-runtime-nvidia


date            | tee    /_install_rocm_hip_sh_
echo "end"      | tee -a /_install_rocm_hip_sh_




# vim: noexpandtab tabstop=4 paste

