#!/bin/bash

FOLDER=$1

SOURCE=/Users/mattdrees/$FOLDER
DEST=/Volumes/Transcend/backup-for-os-x-upgrade/$FOLDER

rsync \
 --archive \
 --extended-attributes \
 --hard-links \
 --partial \
 --sparse \
 --one-file-system \
 --delete \
 --exclude=Library/Containers \
 --progress \
 $SOURCE $DEST ;

#--verbose \
