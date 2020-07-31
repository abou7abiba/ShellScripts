#!/bin/bash

# This script is to compress all videos in one folder to be created in output folder:
# article 1; https://stackoverflow.com/questions/5784661/how-do-you-convert-an-entire-directory-with-ffmpeg
# article 2: https://askubuntu.com/questions/99643/how-can-i-convert-a-1080p-wmv-video-to-a-720p-video
# It will compress the videos from 1080p HD format to 720P HD formate with h264 video compression and aac 
# video compression
# to transpose it use this article: https://askubuntu.com/questions/83711/how-can-i-rotate-a-video


# INPUT_DIR="/home/aibrahim/Documents/IBM/Education/Present with Eminence/coaching/media"
# OUTPUT_DIR="/home/aibrahim/Documents/IBM/Education/Present with Eminence/coaching/media/compressed"

# INPUT_DIR="/home/aibrahim/Documents/Personal/Greens/management_board_2018/FTTH_Telecom_Egypt/videos"
# OUTPUT_DIR="/home/aibrahim/Documents/Personal/Greens/management_board_2018/FTTH_Telecom_Egypt/videos/compressed"

INPUT_DIR="/home/aibrahim/Documents/IBM/IBM Career/AoT Activities/Videos/Original"
OUTPUT_DIR="/home/aibrahim/Documents/IBM/IBM Career/AoT Activities/Videos/compressed"

LOG_FILE="$OUTPUT_DIR"/compression_out.log

SHOW_LOG_FILE="### Check Log out at $LOG_FILE  ###"

echo $SHOW_LOG_FILE


echo "### Input Folder: $INPUT_DIR" |& tee -a "$LOG_FILE"
echo "### Input Folder: $OUTPUT_DIR"|& tee -a "$LOG_FILE"

# Compress each file with .mp4

cd "$INPUT_DIR/"

for i in *.mp4;
  do name=`echo $i | cut -d'.' -f1`;
  echo "\n== $name" |& tee -a "$LOG_FILE";
  echo -e "Compressing From: $INPUT_DIR/$i \nCompressing To: $OUTPUT_DIR/${name}.mp4" |& tee -a "$LOG_FILE";
  ffmpeg -i "$i" -s hd720 -b:a 96k -c:v libx264 -c:a aac -crf 23 "$OUTPUT_DIR/${name}.mp4" |& tee -a "$LOG_FILE";
done
