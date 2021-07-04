#!/bin/bash
inputf="$*"
inputnoext="${inputf%.*}"
outputf="${inputnoext}.hq.mp4"

nice -n 19 ffmpeg -i "$*" \
  -strict experimental \
  -c:v libx264 -preset slow -crf 21 \
  -c:a aac -b:a 196k \
  -vf scale="'if(gt(iw,1280),1280,iw)':-1" \
  -ac 2 \
  "${outputf}"
