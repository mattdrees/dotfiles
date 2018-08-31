#!/bin/sh
### ====================================================================== ###
##                                                                          ##
##  Script to create a new maven module structure (named from parameter     ##
##                                                                          ##
### ====================================================================== ###

set -e

mkdir $1
cd $1
mavenstructure.sh
cd ..
svn add $1
cd $1
svn propset svn:ignore target .


