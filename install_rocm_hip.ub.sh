
#!/bin/bash 

# script to 1: enable abilities to install rocm/hip drivers, 2: try to actually install them.
# expect not to find hip-runtime-nvidia, at least not in rocky 8.9, this is mostly to see if avail in el9
# to be called by Dockerfile 


date            | tee    /_install_rocm_hip_sh_
echo "start"    | tee -a /_install_rocm_hip_sh_

export TERM=dumb
export NO_COLOR=1

# ref https://rocm.docs.amd.com/projects/install-on-linux/en/latest/tutorial/quick-start.html#rocm-install-quick


apt install "linux-headers-$(uname -r)" "linux-modules-extra-$(uname -r)"
#usermod -a -G render,video $LOGNAME # Adding current user to Video, Render groups. See prerequisites.
usermod -a -G render,video ubuntu
wget https://repo.radeon.com/amdgpu-install/6.1/ubuntu/focal/amdgpu-install_6.1.60100-1_all.deb
apt install ./amdgpu-install_6.1.60100-1_all.deb
apt update
apt install amdgpu-dkms
apt install rocm
echo "Please reboot system for all settings to take effect."


echo "============================================================"

# https://tin6150.github.io/psg/general_unix.html
# not sure if driver would install in cloud env... might need to ask for gpu ...
apt-get install ubuntu-drivers-common && sudo ubuntu-drivers autoinstall
# reboot


apt-get install hip-runtime-nvidia hip-dev

# The default paths are:
#CUDA SDK: /usr/local/cuda
#HIP: /opt/rocm/hip
#You can optionally add /opt/rocm/bin to your path, which can make it easier to use the tools.


echo "============================================================"
echo "============================================================"
echo  verify installation
echo "============================================================"
echo "============================================================"
/opt/rocm/bin/hipconfig --full


date            | tee    /_install_rocm_hip_sh_
echo "end"      | tee -a /_install_rocm_hip_sh_




# vim: noexpandtab tabstop=4 paste

