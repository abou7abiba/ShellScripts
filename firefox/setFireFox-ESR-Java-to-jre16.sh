#!/bin/bash

#set the path of the FireFox-ESR Java Plug-in to work with the installed IcedTea Plug-in
gksudo ln -sf /usr/lib/j2re1.6-ibm/jre/lib/i386/libnpjp2.so /etc/alternatives/mozilla-javaplugin.s
