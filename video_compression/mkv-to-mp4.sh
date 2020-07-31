#!/bin/bash

# This script is to convert .MKV videos to .MP4 video format.
# article 1; https://askubuntu.com/questions/667147/how-to-convert-mkv-to-mp4/1072560#1072560

ffmpeg -i input.mkv -acodec copy -vcodec copy output.mp4
