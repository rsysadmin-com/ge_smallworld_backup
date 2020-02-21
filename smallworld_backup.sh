#!/bin/bash

#
# SmallWorld backup script v0.001
#
#       20120220 - martin at mielke dot com
#                  initial version
#                      - full backup
#                      - compressed tarball
#                      - transfer to backup server
#

#
# Some useful definitions
#
year=`date +%Y`
month=`date +%m`
day=`date +%d`
timestamp=$year$month$day

#
# Define the variables below according to your SmallWorld environment:
#
#       smDir = root directory of the local SmallWorld installation
#       smTmp = used for temporary operations, it's safe to leave it so
#       backuptarget = remote user and hostname - you must be able to use ssh keys
#       backupdir= backup directory on the remote host
#    init_script = SmallWorld init script
#
smDir=/GIS42
smTmp=/var/tmp
backuptarget=user@remote-host
backupdir=/backups/SmallWorld/
init_script=/etc/init.d/smallworld_GIS

stopPNI() {
        echo " - Stopping SmallWorld instances..."
        $init_script stop
        echo " - Cleaning up temporary JOU files..."
        find $smDir -type f -name '*.jou' -exec rm -f {} \;
}

startPNI() {
        echo " - Starting SmallWorld..."
        $init_script start
        exit 0
}

# main()

# first we need to stop SmallWorld
stopPNI

# This line actually makes the full backup 
tar -zcf $smTmp/SmallWorld-$timestamp.tar.gz $smDir

# we could start SmallWorld here ...but we won't :-)
# before that we'll copy the tar.gz file to our remote backup server
scp -p $smTmp/SmallWorld-$timestamp.tar.gz $backuptarget:$backupdir

# Some clean-up...
rm -f $smTmp/SmallWorld-$timestamp.tar.gz

# start SmallWorld instance
startPNI
