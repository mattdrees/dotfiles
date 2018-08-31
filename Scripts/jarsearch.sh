#!/bin/bash

usage="Usage: $0 {class} {directory} (for example, '$0 Needle ./haystack')"

class=${1?$usage}
shift
directory=${1?$usage}
shift

find "$directory" -name "*.jar" -exec sh -c 'jar -tf {}|grep -H --label {} '$class'' \;
