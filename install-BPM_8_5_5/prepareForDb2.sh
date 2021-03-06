#!/bin/bash

#Created by A.Ibrahim

# This script is used for preparing Ubuntu 14.04 64 Bit to be ready to install IBM DB2 10.5
# You need to run this script as root.

LOG_FILE=./prepDB2_out.log
SHOW_LOG_FILE="### Check Log out at $(readlink -f $LOG_FILE)  ###"

# Install the following packages: 
# 	libxp6 libpam0g:i386 rpm ksh libaio1 libstdc++6 lib32stdc++6
# needed as per my document as well as this 
# URL http://askubuntu.com/questions/428072/64-bit-db2-10-5-missing-32-bit-libpam-and-64-bit-libaio-on-ubuntu-12-04
STEP_DESC="### Installing Needed Packages for DB2 v10.5 Installation ###"
echo $STEP_DESC
echo $SHOW_LOG_FILE
aptitude -y --log-file=$LOG_FILE install libxp6 libpam0g:i386 rpm ksh libaio1 libstdc++6 lib32stdc++6

ln -s /lib/i386-linux-gnu/libpam.so.0 /lib/libpam.so.0
	
