#!/bin/bash

#converts video file with any extension to extension precised with first parameter
if [ "$#" -ge 2 ];then
    for x in "${@:2}";do
	    ffmpeg -i "$x" "${x%.*}.$1"
    done
else
    echo Usage: "$0" '[format-to-convert] [file/s]'
fi
