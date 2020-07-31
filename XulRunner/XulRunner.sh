#!/bin/bash

#Created by A.Ibrahim

# This script is used for installing XulRunner 1.9.2 on Ubuntu 14.04 64 Bit
# You need to run this script as root.
# the source to be downloaded is from this URL:
# http://ftp.mozilla.org/pub/mozilla.org/xulrunner/nightly/2010/12/2010-12-01-03-mozilla-1.9.2/xulrunner-1.9.2.13.en-US.linux-x86_64.tar.bz2

LOG_FILE=./installXulRunner_out.log
SHOW_LOG_FILE="### Check Log out at $(readlink -f $LOG_FILE)  ###"
echo $SHOW_LOG_FILE

####################################################
# Define input parameters
####################################################

# The path to the XulRunner 1.9.2 64 Bit.
# for more details go to this URL:
# https://askubuntu.com/questions/665409/xpcom-error-0x80004005-with-rtc-4-0-6-on-ubuntu-14-04-64-bit

XULRUNNER_SRC=/media/aibrahim/MySpace/Downloads/System/xulrunner-1.9.2.13.en-US.linux-x86_64.tar.bz2

# The path for the extracted XulRunner 1.9.2
XULRUNNER_DES=/opt


####################################################
# Extract and Register XulRunner
####################################################
echo -e "\n# Extract and Register XulRunner 64 Bit from $XULRUNNER_SRC \n# To: $XULRUNNER_DES" >> $LOG_FILE
tar xvfj $XULRUNNER_SRC -C $XULRUNNER_DES >> $LOG_FILE
$XULRUNNER_DES/xulrunner/xulrunner --register-user >> $LOG_FILE

