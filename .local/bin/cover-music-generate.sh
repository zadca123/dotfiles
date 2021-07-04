#!/bin/sh

#-------------------------------#
# Generate current song cover   #
# ffmpeg version                #
#-------------------------------#

#pkill -RTMIN+12 dwmblocks
# MUSIC_DIR="~/Music"
# MUSIC_DIR="/mnt/seagate/desktop/Music"
COVER="/tmp/cover.png"
COVER_SIZE=175

BORDERS=false
BORDER_WIDTH=5
BORDER_COLOR="white"

ffmpeg_cover() {
    if $BORDERS; then
        ffmpeg -loglevel 0 -y -i "$1" -vf "scale=$COVER_SIZE:-1,pad=$COVER_SIZE+$BORDER_WIDTH:ow:(ow-iw)/2:(oh-ih)/2:$BORDER_COLOR" "$COVER"
    else
        ffmpeg -loglevel 0 -y -i "$1" -vf "scale=$COVER_SIZE:-1" "$COVER"
    fi
    # full resolution cover
    ffmpeg -loglevel 0 -y -i "$1" "/tmp/cover_full_res.png"
}

fallback_find_cover() {
    album="${file%/*}"
    album_cover="$(find "$album" -type d -exec find {} -maxdepth 1 -type f -iregex ".*\(cover?s\|folder?s\|artwork?s\|front?s\|scan?s\).*[.]\(jpe?g\|png\|gif\|bmp\)" \;)"
    if [ "$album_cover" == "" ]; then
        album_cover="$(find "$album" -type d -exec find {} -maxdepth 1 -type f -iregex ".*[.]\(jpe?g\|png\|gif\|bmp\)" \;)"
    fi
    if [ "$album_cover" == "" ]; then
        album_cover="$(find "$album/.." -type d -exec find {} -maxdepth 1 -type f -iregex ".*\(cover?s\|folder?s\|artwork?s\|front?s\|scan?s\|booklet\).*?1[.]\(jpe?g\|png\|gif\|bmp\)" \;)"
    fi
    album_cover="$(echo -n "$album_cover" | head -n1)"
}

{
    # file="$MUSIC_DIR/$(mpc --format %file% current)"
    # file="$(audtool --current-song-filename)"
    file="$(cmus-remote -Q | awk '$1=="file" {$1="";print substr($0,2)}')"

    if [ -n "$file" ] ; then
        if ffmpeg_cover "$file"; then
            exit
        else
            fallback_find_cover
            ffmpeg_cover "$album_cover"
        fi
    fi
} &
