#!/bin/bash

# This script is to start screen casting from android to pc using ADB. 
# The base for this script is the following thread:
# article 1; http://clives-wines.com/page/watch/vid2016x3A3EO8ShMI
# I used the video as well
# video 2: https://www.youtube.com/watch?v=x3A3EO8ShMI#t=57.55725

adb devices
# The followoing command takes time. Be patient.
adb shell screenrecord --output-format=h264 - | ffplay -


