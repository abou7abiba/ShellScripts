#!/bin/bash

###############################################################
# Create a desktop launcher for Stopping BPM 8.5 Environment 
###############################################################

# The path of the shell script.
SHELL_SCRIPT=/home/aibrahim/Documents/Technical/linux/scripts/start-stop-BPM_8_5_5/stopBPM.sh

BPM_NAME="Stop IBM BPM 8.5.6 Envirnment" 
BPM_DESKTOP=/usr/share/applications/IBMBPM_855_STOP_ENV.desktop

echo -e "\n# Createing [$BPM_NAME] Launcher for $SHELL_SCRIPT at $BPM_DESKTOP"
echo -e "[Desktop Entry]
Name=$BPM_NAME
Type=Application
Exec=gksudo $SHELL_SCRIPT
Terminal=true
Icon=/opt/IBM/WebSphere/AppServer/bin/icons/server_stopped.ico
Comment= $BPM_NAME (DMgr, Node, and Environment)
NoDisplay=false
Categories=Development;IDE;Business Process Manager Advanced 8.5;IBM WebSphere
Name[en]=$BPM_NAME" > $BPM_DESKTOP


