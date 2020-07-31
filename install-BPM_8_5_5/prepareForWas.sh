#!/bin/bash

#Created by A.Ibrahim

# This script is used for preparing Ubuntu 14.04 64 Bit to be ready to install IBM WAS 8.5.5
# You need to run this script as root.

LOG_FILE=./prepWAS_out.log
SHOW_LOG_FILE="### Check Log out at $(readlink -f $LOG_FILE)  ###"

# Use Bash to run the installation scripts
STEP_DESC="### Changing shell to bash instead of dash ###"
echo $STEP_DESC
echo $SHOW_LOG_FILE
unlink /bin/sh
ln -s /bin/bash /bin/sh
ll /bin/sh >> $LOG_FILE
