#!/bin/bash

#converts video or audio file with any extension to extension precised with first parameter
display_help(){
    echo "Usage: $0 [format-to-convert] [file/s]"
    echo "Example: $0 opus Despacito.flac GangnamStype.wav"
    echo "Example: $0 webm Video1.mp4 *.mkv"
    exit 2
}
[[ "$#" -lt 2 ]] && dispay_help

ext="$1"
shift 1 # omits 1 parameter from begginnig
for inputf in "$@";do
    outputf="${inputf%.*}.$ext"
    ffmpeg -i "$inputf" "$outputf"
done
