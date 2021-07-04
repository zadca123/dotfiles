#!/bin/bash
# RES=$(xrandr | grep current | cut -d' ' -f8-10 | tr -d ' ') # not works?
OUTPUT=$(date +'%Y-%m-%d_%H:%M:%S')
mkdir -p "$HOME/Documents/vids" 2>/dev/null
DIR=$HOME/Documents/vids

# without audio
# ffmpeg -video_size 2560x1080 -framerate 25 -f x11grab -i :0.0+0,0 "$DIR/vid_${OUTPUT}.mkv"

# #with audio (not works)
# #mic but doesnt work ???
# ffmpeg -video_size 2560x1080 -framerate 25 -f x11grab -i :0.0+0,0 -f alsa -ac 1 -i hw:0 "$DIR/vid_${OUTPUT}.mkv"

# #video with audio
# ffmpeg -video_size "$RES" -framerate 25 -f x11grab -i :0.0+0,0 -f alsa -ac 2 -i pulse "$DIR/vid_${OUTPUT}.mkv"

# # this also captures mic
# ffmpeg -video_size 800x600 -framerate 25 -f x11grab -i :0.0+0,0 -f alsa -ac 2 -i pulse "$DIR/vid_${OUTPUT}.mkv"

ffmpeg -video_size 1024x768 -framerate 25 -f x11grab -i :0.0+0,0 -f alsa -ac default -i pulse -acodec aac -strict experimental "$DIR/vid_${OUTPUT}.mp4"
# ffmpeg -video_size 1024x768 -framerate 25 -f x11grab -i :0.0+0,0 -f alsa -ac 2 -i pulse -acodec aac -strict experimental output.flv

