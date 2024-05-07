
#!/bin/bash 

# script to 1: enable abilities to install rocm/hip drivers, 2: try to actually install them.
# expect not to find hip-runtime-nvidia, at least not in rocky 8.9, this is mostly to see if avail in el9
# to be called by Dockerfile 


date            | tee    /_install_rocm_hip_sh_
echo "start"    | tee -a /_install_rocm_hip_sh_

# ref https://rocm.docs.amd.com/projects/install-on-linux/en/latest/tutorial/quick-start.html#rocm-install-quick


yum -y update 

wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-9.noarch.rpm
sudo rpm -ivh epel-release-latest-9.noarch.rpm
sudo dnf install dnf-plugin-config-manager
sudo crb enable
sudo yum install kernel-headers kernel-devel
#sudo usermod -a -G render,video $LOGNAME # Adding current user to Video, Render groups. See prerequisites.
sudo usermod -a -G render,video operator  # just adding a user as place holder
sudo yum install https://repo.radeon.com/amdgpu-install/6.1/rhel/9.2/amdgpu-install-6.1.60100-1.el9.noarch.rpm
sudo yum clean all
sudo yum install amdgpu-dkms
sudo yum install rocm
echo "Please reboot system for all settings to take effect."

date            | tee    /_install_rocm_hip_sh_
echo "end"      | tee -a /_install_rocm_hip_sh_




# vim: noexpandtab tabstop=4 paste

