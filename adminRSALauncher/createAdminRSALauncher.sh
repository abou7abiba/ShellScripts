#!/bin/bash

###############################################################
# Create a desktop launcher for Starting RSA 9.1 in admin mode 
###############################################################

# The path of the shell script.
SHELL_SCRIPT="/opt/IBM/SDP/eclipse -product com.ibm.rational.rsa4ws.product.v91.ide"

#ICON_PATH="/opt/IBM/SDP/rsa4ws/RSA_v7_32.xpm"
ICON_PATH="/home/aibrahim/Documents/Technical/linux/scripts/adminRSALauncher/RSA_Admin_v7_32.png"

APP_NAME="IBM RSA4WS 9.1 Admin Mode" 
APP_DESKTOP=/usr/share/applications/IBM_RSA_Admin.desktop

echo -e "\n# Createing [$APP_NAME] Launcher for $SHELL_SCRIPT at $APP_DESKTOP"
echo -e "[Desktop Entry]
Name=$APP_NAME
Categories=Application;Development;X-Red-Hat-Base;X-SuSE-Core-Development
Comment=RSA 9.1 in admin mode for WebSphere Software
Encoding=UTF-8
Exec=gksudo \"$SHELL_SCRIPT\"
Icon=$ICON_PATH
Type=Application
Path=/opt/IBM/SDP
Actions=NormalMode;

[Desktop Action NormalMode]
Name=Open RSA 9.1
Exec=$SHELL_SCRIPT
OnlyShowIn=Unity;" > $APP_DESKTOP

