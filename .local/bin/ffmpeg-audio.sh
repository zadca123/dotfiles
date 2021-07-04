#!/bin/bash

if [ "$#" -ge 2 ];then
    for x in "${@:2}";do
 		ffmpeg -i "$x" -qscale:a 0 "${x%.*}.$1"
    done
else
		echo Usage: "$0" '[format-to-convert] [file/s]'
fi
  
