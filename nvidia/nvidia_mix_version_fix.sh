#!/bin/bash

# This script is to fix nvidia driver loading failuer duet to mix versions. 
# The problem is described in this URL:
# article 1; https://askubuntu.com/questions/50469/nvidia-api-mismatch
# I used the following to fix the NVIDIA drivers problem:
# article 2: https://askubuntu.com/questions/342664/nvidia-driver-updated-mixed-versions-of-304-88-and-319-32
# Instead of installing new kernel, I reinstalled the kernel headers again.
# It worked for Nvidia 340 so I updated the script with this.
# execute this script as root.

apt-get update

# Execute this to re-install Kernel 3.8.x(be careful, don't miss any character)
apt-get --reinstall  install linux-generic-lts-raring linux-headers-3.19.0-80 linux-headers-3.19.0-80-generic linux-headers-generic-lts-raring linux-image-3.19.0-80-generic linux-image-generic-lts-raring

update-grub

# Execute this to re-configure all installed packages (It would take some time, so wait. If it fails, gives some error just proceed to next step)
# In my case it didn't take any time as I just reinstalled it.
dpkg-reconfigure -a

# Execute this to restart your system:
reboot

#####
# Now Removing installed and re-configuring nvidia-340
######

# Open terminal and execute following commands to completely remove nvidia-*

apt-get autoremove nvidia-*
apt-get --purge remove nvidia-*
apt-get autoremove
apt-get autoclean

# Then execute these commands to re-configure nvidia-340
# if above command shows some error then try to replace nvidia-319 with nvidia-340* which worked with me.

update-grub
dpkg-reconfigure nvidia-340*

update-grub
update-initramfs -u # (it would take some time)

# Then restart your system
reboot

