#!/bin/bash

# This script is to remove / uninstall nvidia driver. 
# The base for this script is the following threa from Ubuntu formum:
# article 1; https://askubuntu.com/questions/206283/how-can-i-uninstall-a-nvidia-driver-completely
# article 2: https://superuser.com/questions/1003652/ubuntu-14-04-uninstall-manually-installed-nvidia-driver
# you may need to apply steps manually to make sure that it is working from this URL:
# https://codeyarns.com/2013/02/07/how-to-fix-nvidia-driver-failure-on-ubuntu/

echo "### Uninstall Nvidia Driveres"

# Remove  
rm /etc/modprobe.d/blacklist-nvidia-fix.conf

# Remove installed Nvidia packages
apt-get --purge remove nvidia-*
apt-get autoremove

echo "### reinsteall ubuntu-desktop"
apt-get install ubuntu-desktop

echo "### remove xorg.conf"
rm /etc/X11/xorg.conf

echo "### enforce loading nouveau"
echo 'nouveau' | sudo tee -a /etc/modules

echo "### Pepare for installing drivers - prepare dependencies "

#restart
reboot
