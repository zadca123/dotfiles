#!/usr/bin/env bash
#!/usr/bin/env zsh
# zsh for fraction aritmetics ( i must learn bc for bash or awk)

# # inputf="$*"
# # inputnoext="${inputf%.*}"
# # outputf="${inputnoext}.webm"
# # For more visit link below
# # https://unix.stackexchange.com/questions/28803/how-can-i-reduce-a-videos-size-with-ffmpeg
[[ "$#" -lt 2 ]] && display_help

display_help(){
    echo "Usage: ${0##*/} [-n|x|c|d=*|bv=*|ba=*] [file/s]"
    echo "  --normal"
    echo "  --x264"
    echo "  --compress"
    echo "  --downscale=(1.5,2,3...)]"
    echo "  --bitrate-video=1M"
    echo "  --bitrate-audio=320K"
    exit 1
}

for i in "${@:2}"; do
    output="${i%.*}_$1.${i//*.}"
    case "$1" in
        -n | --normal)
    	    ffmpeg -i "$i" "$output"
            ;;
        -x | --x264)
    	   ffmpeg -i "$i" \
               -c:v libx264 "$output"
            ;;
        -c | --compress)
    	   ffmpeg -i "$i" \
               -c:v libx264 \
               -crf 24 \
               -threads 4 -row-mt 1  \
               -tile-columns 6 -frame-parallel 1 \
                "$output"
            ;;
        -d=* | --downscale=*)
            # read -rp "downscale times? (1.5, 2, 3, 4....): " DSC
            # # x=1
            DSC="${1//*\-}"
            while true;do
    	        ffmpeg -i "$i" -vf scale="iw/$DSC:ih/$DSC" \
                    "$output"
    
                # [[ "$?" -ne 0 ]] || break
                (( ? != 0 )) || break
                # DSC=$(bc<<<"$DSC+$x")
                # (( x+=1 ))
                (( DSC += 1))
            done
            ;;
		-bv=* | --bitrate-video=*)
			ffmpeg -i "$i" -c copy -b:v "${1//*\-}" -y "$output"
			# ffmpeg -i "$x" -c copy -map 0:a -map 0:v -b "${1//*\-}" "$output"
            ;;
		-ba=* | --bitrate-audio=*)
			ffmpeg -i "$i" -c copy -b:a "${1//*\-}" -y "$output"
			# ffmpeg -i "$x" -c copy -map 0:a -map 0:v -b "${1//*\-}" "$output"
            ;;
        *)
            display_help
            ;;
    esac
done


# >>3995397
# >>3999547
# >>4002188
# >>4002201
# Maybe we should make a new thread with a no nigger music edition. I'm rangebanned from making threads unfortunately. Also, for webms that aren't dependend on the music I encourage you to make a new version with less faggy / decadent / retarded music.
# Not a particularily good example since the original (webm rel) wasn't that bad in the first place, but it literally took me 2 mins to splice the old webm together with a new audio track to make this one >>3999971.
# I used ffmpeg with these settings:
# >ffmpeg -i ORIG.webm -i NEWAUDIO.wav -map 0:v:0 -map 1:a -acodec libvorbis -c:v copy -fflags shortest -max_interleave_delta 500M -metadata title="ARTIST - TITLE" NEW.webm
