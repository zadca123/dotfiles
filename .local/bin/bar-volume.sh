#!/bin/bash 

#vol=`amixer get Master | awk -F'[][]' 'END{ print $2" "$4 }' | sed 's/on://g'`
vol=$(pamixer --get-volume)
echo -e "$vol%"
