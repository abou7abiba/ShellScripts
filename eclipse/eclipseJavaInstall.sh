#!/bin/bash

# This script is to install eclipse based on the following article:
# article 1; http://ubuntuhandbook.org/index.php/2014/06/install-latest-eclipse-ubuntu-14-04/
# It will create a new directory and extract the given tar.gz file to this directory
#

LOG_FILE=./eclipseInstall_out.log
SHOW_LOG_FILE="### Check Log out at $(readlink -f $LOG_FILE)  ###"
echo $SHOW_LOG_FILE

ECLIPSE_TAR_FILE=/media/aibrahim/MySpace/Downloads/eclipse/eclipse-jee-luna-SR1a-linux-gtk-x86_64.tar.gz
ECLIPSE_NAME="Eclipse Java EE 4.4"
ECLIPSE_SHORT_NAME="eclipse44"
ECLIPSE_DIR=/opt/Eclipse/$ECLIPSE_SHORT_NAME
ECLIPSE_DESKTOP=/usr/share/applications/$ECLIPSE_SHORT_NAME.desktop

# Extracting the archive to the target folder after creating this folder

echo -e "extracting From: $ECLIPSE_TAR_FILE \nExtracting To: $ECLIPSE_DIR"
mkdir $ECLIPSE_DIR
tar -zxvf $ECLIPSE_TAR_FILE -C $ECLIPSE_DIR >> $LOG_FILE
ln -s $ECLIPSE_DIR/eclipse/eclipse /usr/bin/$ECLIPSE_SHORT_NAME

# Create a desktop shortcut for the installed eclipse

echo "Createing $ECLIPSE_NAME shortcut at $ECLIPSE_DESKTOP"
echo -e "[Desktop Entry]
Name=$ECLIPSE_NAME
Type=Application
Exec=$ECLIPSE_SHORT_NAME
Terminal=false
Icon=$ECLIPSE_DIR/eclipse/icon.xpm
Comment=Integrated Development Environment for Java EE Developers
NoDisplay=false
Categories=Development;IDE;
Name[en]=$ECLIPSE_NAME (Luna)" > $ECLIPSE_DESKTOP
