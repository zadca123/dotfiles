#!/bin/bash

display_help(){
    echo "Usage: ${0##*/} [-v|-a|-s] [url/s]"
    echo '-v, --video-best'
    echo '-a, --audio-best'
    echo '-v=..., --video=144|240|360|480|...'
    echo '-a=..., --audio=opus|mp3|ogg|m4a|...'
    exit 1
}

[[ $# -lt 1 ]] && display_help

yt="youtube-dl --add-metadata -i --embed-subs --embed-thumbnail -o"
a_output="$HOME/Podcasts/%(uploader)s/%(title)s.%(ext)s"
v_output="$HOME/Videos/%(title)s.%(ext)s"
clip="$(xclip -o)"

case "$1" in
    -v | --video-best)
        shift
         "$v_output" "$clip" || \
        $yt "$v_output" "$*"
        ;;
    -v=* | --video=*) shift
        $yt "$v_output" -f "bestvideo[height<=${1##*=}]+bestaudio/best[height<=${1##*=}]" "$clip" || \
        $yt "$v_output" -f "bestvideo[height<=${1##*=}]+bestaudio/best[height<=${1##*=}]" "$*"
        # $yt "$v_output" -f 'bestvideo[height<=480]+bestaudio/best[height<=480]' "$clip" || \
        # $yt "$v_output" -f 'bestvideo[height<=480]+bestaudio/best[height<=480]' "$*"
        ;;
    -a | --audio-best) shift
        $yt "$a_output" -x -f bestaudio/best "$clip" || \
        $yt "$a_output" -x -f bestaudio/best "$*"
        ;;
    -a=* | --audio=*) shift
        $yt "$a_output" -x -f "bestaudio/${1##*=}" "$clip" || \
        $yt "$a_output" -x -f "bestaudio/${1##*=}" "$*"
        ;;
    -s | --search) shift
        youtube-dl  "ytsearch:$*"
        ;;
 	*) display_help;;
esac
