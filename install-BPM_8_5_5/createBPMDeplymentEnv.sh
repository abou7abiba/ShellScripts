#!/bin/bash

#Created by A.Ibrahim

# This script is used for configuring BPM 8.5.5 on Ubuntu 14.04 64 Bit
# You need to run this script as root.

LOG_FILE=./configBPMDepEnv_out.log
SHOW_LOG_FILE="### Check Log out at $(readlink -f $LOG_FILE)  ###"

# Generate the database scripts
STEP_DESC="### Create the profiles, deployment manager and the managed nodes for this deplyment environment ###"
echo $STEP_DESC
echo $SHOW_LOG_FILE

BPM_HOME=/opt/IBM/WebSphere/AppServer
DIRECTORY_PATH=.	# Current Directory as this file.
PROPERTIES_FILE=Advanced-PC-SingleCluster-DB2-Ubuntu14_04.properties

$BPM_HOME/bin/BPMConfig.sh -create -de $DIRECTORY_PATH/$PROPERTIES_FILE


