#!/bin/bash

display_help(){
    echo "Usage: ${0##*/} [-v|-a|-s] [url/s]"
    echo '-v, --Download video (default best quality possible)'
    echo '-a, --Download audio (default best quality possible)'
    echo '-f, --Specify audio format to download (works only if format is available), mp3|opus|ogg|m4a'
    echo '-q, --Specify video quality to download, 144|240|360|480|...'
    echo '-h, --Show this help message'
    exit 1
}

[[ $# -lt 1 ]] && display_help

a_output="$HOME/Podcasts/%(uploader)s/%(title)s.%(ext)s"
v_output="$HOME/Videos/%(title)s.%(ext)s"

yt="youtube-dl --add-metadata -i --embed-subs --embed-thumbnail"
quality="bestvideo+bestaudio/best"
format="best"
while getopts v:a:q:f:s:h opt; do
    case $opt in
        v)
            # [[ "$OPTARG" == '' ] && OPTARG="$(xclip -o)"
            $yt -o "$v_output" -f "$quality" "$OPTARG";;
        a) $yt -o "$a_output" -x -f "bestaudio/${format}" "$OPTARG";;
        q) quality="bestvideo[height<=$OPTARG]+bestaudio/best[height<=$OPTARG]";;
        f) format=$OPTARG;;
        s) youtube-dl  "ytsearch:$OPTARG";;
        ?/) display_help;;
        *) display_help;;
    esac
done
