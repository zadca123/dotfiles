#!/bin/bash

OUTPUT=$(date +'%Y-%m-%d_%H:%M:%S')
mkdir -p "$HOME/Documents/vids" 2>/dev/null
DIR=$HOME/Documents/vids

ffmpeg -f x11grab -framerate 25 \
    $(xwininfo | gawk 'match($0, /-geometry ([0-9]+x[0-9]+).([0-9]+).([0-9]+)/, a)\
      { print "-video_size " a[1] " -i +" a[2] "," a[3] }') \
      "$DIR/vid_${OUTPUT}.mkv"


# ffmpeg -video_size 2560x1080 -framerate 25 -f x11grab -i :0.0+0,0 -f alsa -ac 1 -i hw:0 "$DIR/vid_${OUTPUT}.mkv"
