#!/bin/sh
### ====================================================================== ###
##                                                                          ##
##  Script to set $JAVA_HOME to the location                                ##
##  identified by /usr/libexec/java_home.  Parameter indicates the version  ##
##                                                                          ##
### ====================================================================== ###

VERSION=${1:-UNSET}
if [ "$VERSION" = "UNSET" ]
then
	VERSION_PARAMETER=""
else
	VERSION_PARAMETER="--version $VERSION"
fi

export JAVA_HOME=`/usr/libexec/java_home $VERSION_PARAMETER | tr -d '\n'`
