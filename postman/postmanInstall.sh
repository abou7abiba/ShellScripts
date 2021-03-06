#!/bin/bash

# This script is to install postman based on the following article:
# article 1; https://blog.bluematador.com/posts/postman-how-to-install-on-ubuntu-1604/?utm_source=hootsuite&utm_medium=twitter&utm_campaign=
# It will create a new directory and extract the given tar.gz file to this directory
#

LOG_FILE=./postmanInstall_out.log
SHOW_LOG_FILE="### Check Log out at $(readlink -f $LOG_FILE)  ###"
echo $SHOW_LOG_FILE

POSTMAN_TAR_FILE=/home/aibrahim/Downloads/Postman/Postman-linux-x64-6.0.10.tar.gz
POSTMAN_NAME="Postman 6.0"
POSTMAN_SHORT_NAME="Postman"
POSTMAN_DIR=/opt/$POSTMAN_SHORT_NAME
POSTMAN_DESKTOP=/usr/share/applications/$POSTMAN_SHORT_NAME.desktop

# Extracting the archive to the target folder after creating this folder

echo -e "extracting From: $POSTMAN_TAR_FILE \nExtracting To: $POSTMAN_DIR"
# mkdir $POSTMAN_DIR
tar -zxvf $POSTMAN_TAR_FILE -C /opt >> $LOG_FILE
ln -s $POSTMAN_DIR/Postman /usr/bin/postman

# Create a desktop shortcut for the installed application

echo "Createing $POSTMAN_NAME shortcut at $POSTMAN_DESKTOP"
echo -e "[Desktop Entry]
Encoding=UTF-8
Name=$POSTMAN_NAME
Type=Application
Exec=$POSTMAN_DIR/$POSTMAN_SHORT_NAME
Terminal=false
Icon=$POSTMAN_DIR/resources/app/assets/icon.png
Comment=Postman’s API Development Environment
NoDisplay=false
Categories=Development;IDE;
Name[en]=$POSTMAN_NAME (6.0)" > $POSTMAN_DESKTOP
