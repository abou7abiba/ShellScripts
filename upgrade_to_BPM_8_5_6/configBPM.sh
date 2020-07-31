#!/bin/bash

#Created by A.Ibrahim

# This script is used for configuring BPM 8.5.6 on Ubuntu 14.04 64 Bit
# You need to run this script as root.

LOG_FILE=./configBPM_out.log
SHOW_LOG_FILE="### Check Log out at $(readlink -f $LOG_FILE)  ###"

# Generate the database scripts
STEP_DESC="### Generate Needed Scripts to be used for creating the databases ###"
echo $STEP_DESC
echo $SHOW_LOG_FILE

BPM_HOME=/opt/IBM/WebSphere/AppServer
DIRECTORY_PATH=.	#urrent Directory as this file.
DB2_HOME=/home/db2admin
OUT_DIR_PATH=$DB2_HOME/bpmscripts__upgrade_dir
PROPERTIES_FILE=Advanced-PC-SingleCluster-DB2-Ubuntu14_04.properties

$BPM_HOME/bin/BPMConfig.sh -create -sqlfiles $DIRECTORY_PATH/$PROPERTIES_FILE -outputDir $OUT_DIR_PATH
chown -R db2admin:db2admin $OUT_DIR_PATH


