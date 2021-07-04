#!/bin/bash

for x in "${@:2}";do
    if [ "$#" -ge 2 ];then
        ffmpeg -i "$1" -f srt -i "$x" -c:v copy -c:a copy -c:s mov_text /tmp/t.mp4 -y
    else
	    echo Usage: "$0" '[video] [subtitle-file/s (.str)]'
    fi
done
