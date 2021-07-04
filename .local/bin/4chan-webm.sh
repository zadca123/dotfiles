#!/bin/bash

DIR4chan="$HOME/Documents/4chan/$(date +'%Y-%m-%d')"
mkdir -p "$DIR4chan" 2>/dev/null

display_help(){
    echo Usage: "${0//*\/}" '[audio, no-audio, bitrate-(audio,video)-(196K,256K,320K...)] [file/s]'
    echo Usage: "${0//*\/}" '[-a | -n | -bv=(1M,1.4M,2M) -ba=(196K,256K,320K...)] [file/s]'
    echo where:
    echo '  -a'
    echo '  -n'
    echo '  -bv'
    echo '  -ba'

    echo 4chan Directory: "$DIR4chan"
    exit 0
}

[[ "$#" -lt 2 ]] && display_help

for x in "${@:2}";do
    output="${DIR4chan}/${x%.*}.webm"
    case "$1" in
		-a | --audio)
			ffmpeg -i "$x" -c:v libvpx -c:a libvorbis "$output"
            ;;
		-n | --no-audio)
			ffmpeg -i "$x" -map 0:0 -c:v libvpx "$output"
            ;;
		-bv=* | --bitrate-video=*)
			ffmpeg -i "$x" -c copy -b:v "${1//*\=}" "$output"
			# ffmpeg -i "$x" -c copy -map 0:a -map 0:v -b "${1//*\-}" "$output"
            ;;
		-ba=* | --bitrate-audio=*)
			ffmpeg -i "$x" -c copy -b:a "${1//*\=}" "$output"
			# ffmpeg -i "$x" -c copy -map 0:a -map 0:v -b "${1//*\-}" "$output"
            ;;
        *) display_help;;
    esac
done
