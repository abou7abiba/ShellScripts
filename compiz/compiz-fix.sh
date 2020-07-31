#!/bin/bash

# From bug in this URL
#https://bugs.launchpad.net/ubuntu/+source/compiz/+bug/1292830 
# reply #49
# copy this file to  /etc/pm/sleep.d/
setsid compiz --replace

exit 0
