#!/bin/bash

# Automatifally downloads files in clipboard

display_help(){
    notify-send 'Idk what is happening here...'
    # exit 2
}

# It's preventing of multiple instances of script
[[ $(pgrep -c "${0##*/}") -gt 1 ]] && \
    echo Script already running... && exit 2

download="aria2c --allow-overwrite -d"
# download="wget -c --adjust-extension"

# new=$(xclip -o)
while :; do
    new=$(xclip -o)
    if [ "$new" == "$old" ]; then
        echo Nothing new. Sleep 5 sec..
        sleep 5
    else
        case "$new" in
            # save 4chan memes
            *.4cdn.org*[0-9].*)
            dir="$HOME/Documents/memes"; mkdir -p "$dir"
            notify_text="${dir##*$USER/}/${new##*/}"
            notify-send "Saving as $notify_text"

            $download "$dir" "$new"
            ;;
        *.png | *.jpg | *.jpeg | *.gif | *.webm | .mp4)
            dir="$HOME/Downloads/pics_and_vids"; mkdir -p "$dir"
            notify_text="${dir##*$USER/}/${new##*/}"
            notify-send "Saving as $notify_text"

            $download "$dir" "$new"
            ;;
        *.pdf | *.zip | *.7z | *.tar* | *.rar)
            dir="$HOME/Downloads"; mkdir -p "$dir"
            notify_text="${dir##*$USER/}/${new##*/}"
            notify-send "Saving as $notify_text"

            $download "$dir" "$new"
            ;;
        *) display_help;;
    esac
    old=$new
    fi
done
