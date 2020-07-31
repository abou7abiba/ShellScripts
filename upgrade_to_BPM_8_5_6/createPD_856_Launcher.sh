#!/bin/bash

####################################################
# Create a desktop launcher for Process Desginer
####################################################

# The path of the target directory of the installed Process Designer
PD_DIR=/opt/IBM/WebSphere/PD856

PD_SH=$PD_DIR/pd856.sh

PD_NAME="Process Designer 8.5.6"
PD_DESKTOP=/usr/share/applications/IBMBPM_856_PD.desktop

echo -e "\n# Createing $PD_NAME shortcut at $PD_DESKTOP"
echo -e "[Desktop Entry]
Name=$PD_NAME
Type=Application
Exec=gksudo $PD_SH
Terminal=false
Icon=$PD_DIR/bpm_pdesigner/icon.ico
Comment=Process Designer for IBM BPM 8.5.6
NoDisplay=false
Categories=Development;IDE;Business Process Manager Advanced 8.5;IBM WebSphere
Name[en]=Process Designer 8.5.5" > $PD_DESKTOP

