#!/bin/bash

if [ "$#" -ge 2 ];then
    for x in "${@:2}";do
	    ffmpeg -i "$x" "${x%.*}.$1"
    done
else
    echo Usage: "$0" '[format-to-convert] [file]'
fi
