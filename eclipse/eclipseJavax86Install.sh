#!/bin/bash

# This script is to install eclipse based on the following article:
# article 1; http://ubuntuhandbook.org/index.php/2014/06/install-latest-eclipse-ubuntu-14-04/
# It will create a new directory and extract the given tar.gz file to this directory
#

LOG_FILE=./eclipseInstall_out.log
SHOW_LOG_FILE="### Check Log out at $(readlink -f $LOG_FILE)  ###"
echo $SHOW_LOG_FILE

ECLIPSE_TAR_FILE=/media/aibrahim/MySpace/Downloads/eclipse/eclipse-java-helios-linux-gtk.tar.gz
ECLIPSE_NAME="Eclipse java 3.6 32Bit"
ECLIPSE_SHORT_NAME="eclipse36_x86"
ECLIPS_DIR=/opt/Eclipse/$ECLIPSE_SHORT_NAME
ECLIPSE_DESKTOP=/usr/share/applications/$ECLIPSE_SHORT_NAME.desktop

# Extracting the archive to the target folder after creating this folder

echo -e "extracting From: $ECLIPSE_TAR_FILE \nExtracting To: $ECLIPS_DIR"
mkdir $ECLIPS_DIR
tar -zxvf $ECLIPSE_TAR_FILE -C $ECLIPS_DIR >> $LOG_FILE

# Create a desktop shortcut for the installed eclipse

echo "Createing $ECLIPSE_NAME shortcut at $ECLIPSE_DESKTOP"
echo -e "[Desktop Entry]
Name=$ECLIPSE_NAME
Type=Application
Exec=$ECLIPS_DIR/eclipse/eclipse
Terminal=false
Icon=$ECLIPS_DIR/eclipse/icon.xpm
Comment=Integrated Development Environment for Java Developers
NoDisplay=false
Categories=Development;IDE;
Name[en]=$ECLIPSE_NAME (Helios)" > $ECLIPSE_DESKTOP
