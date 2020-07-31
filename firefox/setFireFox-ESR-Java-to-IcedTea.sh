#!/bin/bash

#set the path of the FireFox-ESR Java Plug-in to work with the installed IcedTea Plug-in
gksudo ln -sf /usr/lib/jvm/java-7-openjdk-i386/jre/lib/i386/IcedTeaPlugin.so /etc/alternatives/mozilla-javaplugin.so
