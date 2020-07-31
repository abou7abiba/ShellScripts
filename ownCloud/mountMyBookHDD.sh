#!/bin/bash

# By A.Ibrahim
# Start ownCloud through starting the docker image into a container using docker-compose. 
# For details:
# 	https://doc.owncloud.com/server/admin_manual/installation/docker/
#
# To mount the "My Book" HDD with 6TB and exFAT formate to the docker image you need to mount it as 
# user www-data user to be able to mount it to the docekr container and get the needed access rights.
#
# You need to execute this file as root


# To mount the "My Book" HDD as user "www-data:root" you will execute the following command
# where www-data uid = 33 and root group gid = 0
#
# for more details about how to mount the HDD in this URL
# https://help.ubuntu.com/community/Mount/USB
#
# About how to get the uid and gid 
# id www-data
# results looks like: uid=33(www-data) gid=33(www-data) groups=33(www-data)
# https://askubuntu.com/questions/468236/how-can-i-find-my-user-id-uid-from-terminal

echo "# Mount MyBook HDD as www-data user"

mkdir /media/MyBook/
chown -R www-data:root /media/MyBook
mount -t exfat /dev/sdc1 /media/MyBook/ -o uid=33,gid=0,utf8,dmask=027,fmask=137

echo "## Mounting MyBook HDD Completed ##"
