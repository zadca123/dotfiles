#!/bin/bash

display_help(){
    notify-send 'Idk what is happening here...'
    # exit 2
}
dir1="$HOME/Documents/memes"
dir2="$HOME/Downloads"
[[ -d $dir1 && -d $dir2 ]] || mkdir "$dir1" "$dir2"

new=$(xclip -o)
while :; do
    new=$(xclip -o)
    if [ "$new" == "$old" ]; then
        echo Nothing new. Sleep 5 sec..
        sleep 5
    else
        case "$new" in
            *.png | *.jpg | *.jpeg | *.gif | *.webm | .mp4)
                notify-send "Saving as ~/Documents/memes/${new//*\/}"
                aria2c --allow-overwrite -d "$dir1" "$new"
                ;;
            *.pdf | *.zip | *.7z | *.tar* | *.rar)
                notify-send "Saving as ~/Downloads/${new//*\/}"
                aria2c --allow-overwrite -d "$dir2" "$new"
                ;;

            *) display_help;;
        esac
        old=$new
    fi
done
