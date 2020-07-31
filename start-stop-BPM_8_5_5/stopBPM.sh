#!/bin/bash

#Created by A.Ibrahim

# This script is used for stopping BPM 8.5. It stops the deplyment environment, node agent, and deployment manager.
# You need to run this script as root.

LOG_FILE=./stopBPM_out.log
SHOW_LOG_FILE="### Check Log out at $(readlink -f $LOG_FILE)  ###"

# Generate the database scripts
STEP_DESC="### Stopping the BPM 8.5.6 ###"
echo $STEP_DESC
echo $SHOW_LOG_FILE

BPM_HOME=/opt/IBM/WebSphere/AppServer
DMGR_PROFILE=BpmDmgrProfile
NODE_PROFILE=BpmNode1Profile

echo "# Stop Deployment Environment"
$BPM_HOME/bin/BPMConfig.sh -stop -profile $DMGR_PROFILE -de De1 -username bpmadmin -password bpmadmin >> $LOG_FILE

echo "# Stop Node Agent"
$BPM_HOME/profiles/$NODE_PROFILE/bin/stopNode.sh >> $LOG_FILE

echo "# Stop Deployment Manager"
$BPM_HOME/profiles/$DMGR_PROFILE/bin/stopManager.sh >> $LOG_FILE

echo "## Stopping BPM Completed ##"

