#!/bin/bash

# This script is to install eclipse based on the following article:
# article 1; http://ubuntuhandbook.org/index.php/2014/06/install-latest-eclipse-ubuntu-14-04/
# It will create a new directory and extract the given tar.gz file to this directory
#

ECLIPSE_TAR_FILE=/media/aibrahim/MySpace/Downloads/eclipse/eclipse-modeling-oxygen-3-linux-gtk-x86_64.tar.gz
ECLIPSE_NAME="Eclipse Modeliing 4.7"
ECLIPSE_SHORT_NAME="eclipse-modeling"
ECLIPSE_DIR=/opt/Eclipse/$ECLIPSE_SHORT_NAME
ECLIPSE_DESKTOP=/usr/share/applications/$ECLIPSE_SHORT_NAME.desktop

LOG_FILE="./$ECLIPSE_SHORT_NAME"
LOG_FILE+="_out.log"
SHOW_LOG_FILE="### Check Log out at $(readlink -f $LOG_FILE)  ###"
echo $SHOW_LOG_FILE

# Extracting the archive to the target folder after creating this folder

if [ "$1" = "install" ]
then
	echo -e "extracting From: $ECLIPSE_TAR_FILE \nExtracting To: $ECLIPSE_DIR" 2>&1 | tee -a $LOG_FILE
	mkdir $ECLIPSE_DIR $LOG_FILE
	tar -zxvf $ECLIPSE_TAR_FILE -C $ECLIPSE_DIR >> $LOG_FILE
fi

# Create a link to access the application
ln -s $ECLIPSE_DIR/eclipse/eclipse /usr/bin/$ECLIPSE_SHORT_NAME 2>&1 | tee -a $LOG_FILE

# Create a desktop shortcut for the installed eclipse

echo "Createing $ECLIPSE_NAME shortcut at $ECLIPSE_DESKTOP"
echo -e "[Desktop Entry]
Name=$ECLIPSE_NAME
Type=Application
Exec=$ECLIPSE_SHORT_NAME
Terminal=false
Icon=$ECLIPSE_DIR/eclipse/icon.xpm
Comment=Integrated Development Environment for JavaScript Developers
NoDisplay=false
Categories=Development;IDE;
Name[en]=$ECLIPSE_NAME (Luna)" > $ECLIPSE_DESKTOP
