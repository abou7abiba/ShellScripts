#!/bin/bash

# By A.Ibrahim
# Solves a problem of Ubuntu Gnome 14.04 forgets multi-monitor settings and the solution is in the following URL
# http://ubuntuforums.org/showthread.php?t=2217962

sudo pkill -9 -f gnome-settings-daemon 

