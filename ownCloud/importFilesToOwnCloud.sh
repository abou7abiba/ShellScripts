#!/bin/bash

# By A.Ibrahim
# Start ownCloud through starting the docker image into a container using docker-compose. 
# For details:
# 	https://doc.owncloud.com/server/admin_manual/installation/docker/
#
# To import files to ownCloud you need to update the database of ownCloud after copying the files to a special path.
# 
# For the details about it you can find this article.
#	https://bartsimons.me/manually-add-files-to-owncloud/ 


# 

echo "# Mount MyBook HDD as www-data user"

mkdir /media/MyBook/
chown -R www-data:root /media/MyBook
docker-compose exec owncloud occ files:scan --all

echo "## Mounting MyBook HDD Completed ##"
