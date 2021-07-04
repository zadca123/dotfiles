#!/bin/bash

if [ "$#" -eq 1 ];then
    ffmpeg -loglevel 0 -y -i "$1" "$PWD/cover.png"
else
    echo Usage "$0": '[audio-file]'
fi
