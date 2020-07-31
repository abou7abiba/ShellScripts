#!/bin/bash

# This script is to export github issues based on the following article:
# article 1; https://stackoverflow.com/questions/41369365/how-can-i-export-github-issues-to-excel
# It will create a new JSON file with all the contents.
#
# You can later use the online tool (https://konklone.io/json/) to export JSON file to CSV file

HOST_NAME=github.ibm.com
REPO_OWNER=aibrahim-eg
REPO_NAME=eCorrespondence
ACCESS_TOKEN=ab95a246fafea8efaf8b0107f6ec2b694b83e736
OUT_FOLDER="/home/aibrahim/Documents/IBM/Engagements/Al-Rajhi-ECM/correspondance system/defects"
ISSUE_STATE=all
ISSUE_LABELS=Playback1%20Comment

# curl https://api.$HOST_NAME/repos/$REPO_OWNER/$REPO_NAME/issues?state=$ISSUE_STATE&labels=$ISSUE_LABELS&access_token=$ACCESS_TOKEN > "$OUT_FOLDER"/issues_playback.json

curl https://api.$HOST_NAME/repos/$REPO_OWNER/$REPO_NAME/issues?state=$ISSUE_STATE&access_token=$ACCESS_TOKEN > "$OUT_FOLDER"/issues_playback.json
