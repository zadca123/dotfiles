#!/bin/sh
# [ "$#" -eq 1 ] && x=$(pwd) || x="$1"

# find /some/dir -maxdepth 1 \( -name '*.c' -o -name '*.h' \) -print
if [ "$#" -eq 1 ];then
    x="$(pwd)"
else
    x="$2"
fi

case $1 in
    memes)
    	# find "$1" -mount -type f | grep --color ".mkv\|.mp4\|.avi"
    	find "$x" -mount -type f \
    		-name "*.jpeg" -or \
    		-name "*.jpg" -or \
    		-name "*.png" -or \
    		-name "*.gif" -or \
    		-name "*.webm"
    	;;
    video)
    	# find "$1" -mount -type f | grep --color ".mkv\|.mp4\|.avi"
    	find "$x" -mount -type f \
    		-name "*.mkv" -or \
    		-name "*.mp4" -or \
    		-name "*.avi" -or \
    		-name "*.webm"
    	;;
    audio)
    	# find "$1" -mount -type f | grep --color ".flac\|.mp3\|.ogg\|.opus\|.wav"
    	find "$x" -mount -type f \
    		-name "*.flac" -or \
    		-name "*.opus" -or \
    		-name "*.mp3" -or \
    		-name "*.m4a" -or \
    		-name "*.ogg" -or \
    		-name "*.wav"
    	;;
    ebook)
    	# find "$!" -mount -type f | grep --color ".mobi\|.epub\|.azw3\|.pdf"
    	find "$x" -mount -type f \
    		-name "*.mobi" -or \
    		-name "*.epub" -or \
    		-name "*.azw3" -or \
    		-name "*.rtf" -or \
    		-name "*.pdf"
    	;;
    image)
    	find "$x" -mount -type f \
    		-name "*.jpeg" -or \
    		-name "*.jpg" -or \
    		-name "*.png" -or \
    		-name "*.gif" -or \
    		-name "*.svg"
    	;;
    code)
    	find "$x" -mount -type f \
    		-name "*.java" -or \
    		-name "*.json" -or \
    		-name "*.html" -or \
    		-name "*.cpp" -or \
    		-name "*.py" -or \
    		-name "*.pl" -or \
    		-name "*.sh" -or \
    		-name "*.c"
    	;;
    document)
    	find "$x" -mount -type f \
    		-name "*.docx" -or \
    		-name "*.xmlx" -or \
    		-name "*.doc" -or \
    		-name "*.xml" -or \
    		-name "*.rtf" -or \
    		-name "*.od*" -or \
    		-name "*.txt"
    	;;
    *)
    	echo Usage: "$0" '[type] [start-location]'
    	echo Types: '[memes, video, audio, ebook, image, code, document]'
    	;;
esac;
