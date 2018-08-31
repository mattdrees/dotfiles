#!/bin/sh
### ====================================================================== ###
##                                                                          ##
##  Script to restart a service on one of our windows servers               ##
##                                                                          ##
### ====================================================================== ###


set -e

USERNAME=NET/$NET_USERNAME

/bin/echo -n "Password for $USERNAME: "

stty -echo
read password
stty echo
echo ""         # force a carriage return to be output

DEFAULT_SERVICE='Tomcat - Staff Services';

SERVER=$1
SERVICE=${2:-$DEFAULT_SERVICE}

net rpc service stop "$SERVICE" -I hart-$SERVER.net.ccci.org -U $USERNAME%$password

sleep 5

net rpc service start "$SERVICE" -I hart-$SERVER.net.ccci.org -U $USERNAME%$password


