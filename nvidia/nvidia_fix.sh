#!/bin/bash

# This script is to fix nvidia driver problem that preveneted from starting LightDM. 
# The base for this script is the following threa from Ubuntu formum:
# article 1; https://ubuntuforums.org/showthread.php?t=1555264
# I used the following to uninstall NVIDIA drivers
# article 2: https://askubuntu.com/questions/189347/how-can-i-uninstall-nvidia-proprietary-drivers
# In BIOS, you need to set the graphics to NVIDIA Optimus, and to enable the system detection.

echo "### Uninstall Nvidia Driveres"
#stop X11 inculuding standard login
service lightdm stop

# Uninstall Nvidia drivers
nvidia-uninstall

# Remove installed Nvidia packages
apt-get --purge remove nvidia-*

echo "### Pepare for installing drivers - prepare dependencies "

# Make sure you have the dependencies to build and install the driver
apt-get install nvidia-current nvidia-settings nvidia-prime
apt-get remove nvidia-current nvidia-settings



#uninstall bumblebee and nvidia drivers
apt-get purge bumblebee* nvidia*

# From article 1
apt-get install --reinstall libgl1-mesa-dri libgl1-mesa-glx libegl1-mesa-drivers

#From article 2
#reinstall nvidia 331 
#(the only driver that apparently works correctly with my video card)
apt-get install nvidia-331 nvidia-settings nvidia-prime

# The following command was the main thing that makes the above to work.
# The problem is a bug in ubuntu-drivers-common. I could solve it by downgrading to ubuntu-drivers-common=1:0.2.91.4
aptitude install ubuntu-drivers-common=1:0.2.91.4
aptitude hold ubuntu-drivers-common

# you will need to add the "nox2apic" option to the grub command line as per this URL:
# http://twocentsonsoftware.blogspot.co.uk/2013/02/installing-nvidia-drivers-on-w530-with.html
# By this, the descret option will be able to be enabled, otherwise withouth this option, it will hang the system

#restart
reboot
