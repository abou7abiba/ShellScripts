#!/bin/bash

#Created by A.Ibrahim

# This script is used for enabling the import feature in the installaiton manager for more details have a look to the below URL
# http://www-01.ibm.com/support/knowledgecenter/SSDV2W_1.7.3/com.ibm.cic.agent.ui.doc/topics/t_import_pkg.html
# You need to run this script as root.

LOG_FILE=./enableImport_out.log
SHOW_LOG_FILE="### Check Log out at $(readlink -f $LOG_FILE)  ###"

# Run the created response file using the imcl tool as per the below link
# http://www-01.ibm.com/support/knowledgecenter/SSDV2W_1.7.0/com.ibm.silentinstall12.doc/topics/t_disabling_preferences.html
RESPONSE_FILE=./enableImport.xml
/opt/IBM/InstallationManager/eclipse/tools/imcl input $RESPONSE_FILE
	
