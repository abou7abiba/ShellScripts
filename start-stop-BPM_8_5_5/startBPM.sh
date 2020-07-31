#!/bin/bash

#Created by A.Ibrahim

# This script is used for startin BPM 8.5.5. It starts
# You need to run this script as root.

LOG_FILE=./startBPM_out.log
SHOW_LOG_FILE="### Check Log out at $(readlink -f $LOG_FILE)  ###"

# Generate the database scripts
STEP_DESC="### Starting the BPM 8.5.5 ###"
echo $STEP_DESC
echo $SHOW_LOG_FILE

BPM_HOME=/opt/IBM/WebSphere/AppServer
DMGR_PROFILE=BpmDmgrProfile
NODE_PROFILE=BpmNode1Profile

echo "# Start Deployment Manager"
$BPM_HOME/profiles/$DMGR_PROFILE/bin/startManager.sh >> $LOG_FILE

echo "# Start Node Agent"
$BPM_HOME/profiles/$NODE_PROFILE/bin/startNode.sh >> $LOG_FILE

echo "# Start Deployment Environment"
$BPM_HOME/bin/BPMConfig.sh -start -profile $DMGR_PROFILE -de De1 >> $LOG_FILE

echo "## Starting BPM Completed ##"

