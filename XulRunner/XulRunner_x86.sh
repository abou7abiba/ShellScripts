#!/bin/bash

#Created by A.Ibrahim

# This script is used for installing XulRunner 1.9.2 on Ubuntu 14.04 64 Bit
# You need to run this script as root.
# the source to be downloaded is from this URL:
# http://ftp.mozilla.org/pub/mozilla.org/xulrunner/releases/3.6.26/runtimes/xulrunner-3.6.26.en-US.linux-i686.tar.bz2

LOG_FILE=./installXulRunner_out.log
SHOW_LOG_FILE="### Check Log out at $(readlink -f $LOG_FILE)  ###"
echo $SHOW_LOG_FILE

####################################################
# Define input parameters
####################################################

# The path to the XulRunner 1.9.2 32 Bit

XULRUNNER_SRC=/media/aibrahim/MySpace/Downloads/System/xulrunner-3.6.26.en-US.linux-i686.tar.bz2 

# The path for the extracted XulRunner 1.9.2 32 bit
XULRUNNER_DES=/opt/xulrunner_x86


####################################################
# Extract and Register XulRunner
####################################################
echo -e "\n# Extract and Register XulRunner 32 Bit from $XULRUNNER_SRC \n# To: $XULRUNNER_DES" >> $LOG_FILE
tar xvfj $XULRUNNER_SRC -C $XULRUNNER_DES >> $LOG_FILE
$XULRUNNER_DES/xulrunner/xulrunner --register-user >> $LOG_FILE

