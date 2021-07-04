#!/bin/bash

if [ "$#" -ge 2 ];then
    libreoffice --headless --invisible --convert-to "$1" "${@:2}"  
else
	echo Usage: "$0" '[format-to-convert] [file/s] '
fi
