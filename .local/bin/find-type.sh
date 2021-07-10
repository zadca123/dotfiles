#!/usr/bin/env bash

display_help(){
    	echo Usage: "$0" '[type] [start-location]'
    	echo Types: '[memes, video, audio, ebook, image, code, document]'
        exit 2
}

[[ $# -lt 1 ]] && display_help
[[ -d "$1" ]] && PWD="$1"
shift

# find /some/dir -maxdepth 1 \( -name '*.c' -o -name '*.h' \) -print
fd="find $PWD -mount -type f"
case $1 in
    memes)
    	$fd \
    		-name "*.jpeg" -o \
    		-name "*.jpg" -o \
    		-name "*.png" -o \
    		-name "*.gif" -o \
    		-name "*.webm"
    	;;
    video)
    	$fd \
    		-name "*.mkv" -o \
    		-name "*.mp4" -o \
    		-name "*.avi" -o \
    		-name "*.webm"
    	;;
    audio)
    	$fd \
    		-name "*.flac" -o \
    		-name "*.opus" -o \
    		-name "*.mp3" -o \
    		-name "*.m4a" -o \
    		-name "*.ogg" -o \
    		-name "*.wav"
    	;;
    ebook)
    	$fd \
    		-name "*.mobi" -o \
    		-name "*.epub" -o \
    		-name "*.azw3" -o \
    		-name "*.rtf" -o \
    		-name "*.pdf"
    	;;
    image)
    	$fd \
    		-name "*.jpeg" -o \
    		-name "*.jpg" -o \
    		-name "*.png" -o \
    		-name "*.gif" -o \
    		-name "*.svg"
    	;;
    code)
    	$fd \
    		-name "*.java" -o \
    		-name "*.json" -o \
    		-name "*.html" -o \
    		-name "*.cpp" -o \
    		-name "*.py" -o \
    		-name "*.pl" -o \
    		-name "*.sh" -o \
    		-name "*.c"
    	;;
    document)
    	$fd \
    		-name "*.docx" -o \
    		-name "*.xmlx" -o \
    		-name "*.doc" -o \
    		-name "*.xml" -o \
    		-name "*.rtf" -o \
    		-name "*.od*" -o \
    		-name "*.txt"
    	;;
    *)display_help
    	;;
esac;
