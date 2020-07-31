#!/bin/bash

# This script is to install nvidia driver based on the following two answers URL:
# article 1; http://askubuntu.com/questions/500829/cant-detect-external-monitor-on-thinkpad-w530-running-ubuntu-14-04
# article 2: http://askubuntu.com/questions/528524/how-to-fix-multi-display-after-upgrade-ubuntu-gnome-14-04-nvidia-optimus
# In BIOS, you need to set the graphics to NVIDIA Optimus, and to enable the system detection.

echo "Install Nvidia Driveres"

#uninstall bumblebee and nvidia drivers
apt-get purge bumblebee* nvidia*

# From article 1
apt-get install --reinstall libgl1-mesa-dri libgl1-mesa-glx libegl1-mesa-drivers

#From article 2
#reinstall nvidia 331 
#(the only driver that apparently works correctly with my video card)
apt-get install nvidia-331 nvidia-settings nvidia-prime

# The nvidia-modprobe utility is used to load NVIDIA kernel modules and create NVIDIA character device files automatically everytime your machine boots up
apt-get install nvidia-modprobe

# The following command was the main thing that makes the above to work.
# The problem is a bug in ubuntu-drivers-common. I could solve it by downgrading to ubuntu-drivers-common=1:0.2.91.4
aptitude install ubuntu-drivers-common=1:0.2.91.4
aptitude hold ubuntu-drivers-common

echo "### remove old xorg.conf and create new one"
rm /etc/X11/xorg.conf

# allow it to make a xorg.conf or make your own after the install is complete
nvidia-xconfig -s --no-logo --force-generate --output-xconfig=/etc/X11/xorg.conf

# you will need to add the "nox2apic" option to the grub command line as per this URL:
# http://twocentsonsoftware.blogspot.co.uk/2013/02/installing-nvidia-drivers-on-w530-with.html
# By this, the descret option will be able to be enabled, otherwise withouth this option, it will hang the system

#restart
#reboot
