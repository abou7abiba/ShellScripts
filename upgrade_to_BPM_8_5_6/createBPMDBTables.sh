#!/bin/bash

#Created by A.Ibrahim

# This script is used for creating BPM 8.5.6 DB Tables of the DM Node on Ubuntu 14.04 64 Bit
# You need to run this script as db2admin.

USERNAME=db2admin 
PASSWORD=KhlqJ@d1d 
DBSCRIPTS_HOME=/home/db2admin/dbscripts 
CELL_NAME=PCCell1 
DE_NAME=PCCell1.De1 

echo "## Start Creating BPM 8.5.5 Tables ##" 

echo "# Run the scripts manually for a cell-scoped Common database configuration:" 
db2 connect to CMNDB USER $USERNAME USING $PASSWORD 
db2 -tvf $DBSCRIPTS_HOME/$CELL_NAME/DB2/CMNDB/createSchema_Advanced.sql 
db2 connect reset 

echo "# Run the scripts manually for a deployment environment-level Common database configuration" 
db2 connect to CMNDB USER $USERNAME USING $PASSWORD 
db2 -tvf $DBSCRIPTS_HOME/$DE_NAME/DB2/CMNDB/createSchema_Advanced.sql 

db2 -tvf $DBSCRIPTS_HOME/$DE_NAME/DB2/CMNDB/createSchema_Messaging.sql 
db2 connect reset 

echo "# Run the scripts manually for Process database configuration" 
db2 connect to BPMDB USER $USERNAME USING $PASSWORD 
db2 -tvf $DBSCRIPTS_HOME/$DE_NAME/DB2/BPMDB/createSchema_Advanced.sql 

db2 -tvf $DBSCRIPTS_HOME/$DE_NAME/DB2/BPMDB/createSchema_Messaging.sql 
db2 connect reset 

echo "# Run the scripts manually for Performance Data Warehouse database configuration" 
db2 connect to PDWDB USER $USERNAME USING $PASSWORD 
db2 -tvf $DBSCRIPTS_HOME/$DE_NAME/DB2/PDWDB/createSchema_Advanced.sql 
db2 connect reset 

echo "## Creating Tables completed ##"
