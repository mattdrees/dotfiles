#!/bin/sh
### ====================================================================== ###
##                                                                          ##
##  Script to mount a remote server on the Lake Hart network                ##
##                                                                          ##
### ====================================================================== ###

SERVER=$1
DRIVE=${2:-W}
MOUNT_DIR=~/Mounts/
mkdir $MOUNT_DIR/$SERVER-$DRIVE
mount -t smbfs "//NET;$NET_USERNAME@hart-$SERVER.net.ccci.org/$DRIVE$" $MOUNT_DIR/$SERVER-$DRIVE


