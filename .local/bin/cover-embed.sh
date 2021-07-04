#!/bin/bash

if [ "$#" -ge 2 ];then
    for x in "${@:2}";do
        cp "$x" "new_${x}"
        ffmpeg -i "$x" -i "$1" -map 0 -map 1 -c copy -disposition:v:1 attached_pic "new_${x}"
        # ffmpeg -i "$x" -i "$1" -map 0 -map 1 -c copy -disposition:v:1 attached_pic "$x"
    done
else
    echo Usage: "$0" '[cover/image] [audio file/s]'
fi
