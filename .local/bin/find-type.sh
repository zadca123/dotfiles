#!/usr/bin/env bash

display_help(){
    echo "Usage: $0 -[m|v|a|e|i|c|d|h]"
    echo "Types:"
    echo "-m  --Finds all memes files"
    echo "-v  --Finds all video files"
    echo "-a  --Finds all audio files"
    echo "-e  --Finds all ebook files"
    echo "-i  --Finds all image files"
    echo "-c  --Finds all code files"
    echo "-d  --Finds all document files"
    echo "-h  --Shows this message"
    exit 2
}

[[ $# -lt 1 ]] && display_help

if [ -d "$1" ]; then
    PWD="$1" 
    shift
else
    PWD=$(pwd -P)
fi

# find /some/dir -maxdepth 1 \( -name '*.c' -o -name '*.h' \) -print
while getopts 'mvaeicdh' opt; do
    case $opt in
        m)ext="\.jpeg$\|\.jpg$\|\.png$\|\.gif$\|\.webm$";; # memes
        v)ext="\.mkv$\|\.mp4$\|\.avi$\|\.webm$";; # video
        a)ext="\.flac$\|\.opus$\|\.mp3$\|\.m4a$\|\.ogg$\|\.wav$";; # audio
        e)ext="\.mobi$\|\.epub$\|\.azw3$\|\.rtf$\|\.pdf$";; # ebook
        i)ext="\.jpeg$\|\.jpg$\|\.png$\|\.gif$\|\.svg$\|\.xcf$";; # image
        c)ext="\.java$\|\.json$\|\.html$\|\.cpp$\|\.py$\|\.pl$\|\.sh$\|\.c$";; # code
        d)ext=".docx$\|.xmlx$\|.doc$\|xml$\|.rtf$\|.odt$\|.txt";; # document
        h|:|\?|*)display_help;;
    esac;
done

find "$PWD" -mount -type f | grep --color "$ext"
