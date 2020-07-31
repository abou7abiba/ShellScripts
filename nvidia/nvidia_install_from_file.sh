#!/bin/bash

# This script is to install nvidia driver from a file downloaded based on the following two answers URL:
# article 1; https://gist.github.com/wangruohui/df039f0dc434d6486f5d4d098aa52d07#common-errors-and-solutions
# article 2: http://askubuntu.com/questions/528524/how-to-fix-multi-display-after-upgrade-ubuntu-gnome-14-04-nvidia-optimus
# In BIOS, you need to set the graphics to NVIDIA Optimus, and to enable the system detection.

echo "=== Install Nvidia Driveres"

echo "=== Install Driveres dependencies"
#uninstall bumblebee and nvidia drivers
apt-get purge bumblebee* nvidia*

# From article 1
apt-get install build-essential gcc-multilib dkms
# From article 2
apt-get install --reinstall libgl1-mesa-dri libgl1-mesa-glx libegl1-mesa-drivers

# Here you have to create blocklist file as descriped in article 1 and restart


# Stop lightdm from command prompt. 
sudo service lightdm stop

# Run the installation file
echo "=== Run command file"
cd /home/aibrahim/Downloads/nvidia
chmod +x ./NVIDIA-Linux-x86_64-384.69.run
./NVIDIA-Linux-x86_64-367.57.run --no-opengl-files --dkms

# Validate the installation
echo "=== Run installation validation"
nvidia-smi

# you will need to add the "nox2apic" option to the grub command line as per this URL:
# http://twocentsonsoftware.blogspot.co.uk/2013/02/installing-nvidia-drivers-on-w530-with.html
# By this, the descret option will be able to be enabled, otherwise withouth this option, it will hang the system

#restart
#reboot
