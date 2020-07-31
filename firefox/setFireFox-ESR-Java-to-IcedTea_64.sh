#!/bin/bash

ICEDTEA_PATH_X64=/usr/lib/jvm/java-7-openjdk-amd64/jre/lib/amd64/IcedTeaPlugin.so
ICEDTEA_ALTERNATIVE=/etc/alternatives/IcedTeaPlugin.so
FIREFOX_JAVA_PLUGIN=/usr/lib/mozilla/plugins/libjavaplugin.so

#create ICedtee alternative
ln -sf $ICEDTEA_PATH_X64 $ICEDTEA_ALTERNATIVE


#set the path of the FireFox-ESR Java Plug-in to work with the installed IcedTea Plug-in
ln -sf $ICEDTEA_ALTERNATIVE $FIREFOX_JAVA_PLUGIN
