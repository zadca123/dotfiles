#!/bin/bash

# ffmpeg screen record
frec () {
    wd=$(xwininfo -root | awk 'FNR == 8 {print $2}')
    ht=$(xwininfo -root | awk 'FNR == 9 {print $2}')
    fn="$(date '+%H-%M-%S').webm"
    if [ $1 = 'web'  ]; then

        ffmpeg \
            -video_size ${wd}x${ht}  \
            -framerate 30 -f x11grab \
            -i :0.0 -pix_fmt yuv420p -c:v libvpx \
            -crf 12 -b:v 500K "$fn"
    else
        fn="$(date '+%H-%M-%S').mp4"
        ffmpeg \
         -video_size ${wd}x${ht} \
         -framerate 25 -f x11grab \
         -i :0.0 -pix_fmt yuv420p "$fn"
    fi

}

frec "$1"
