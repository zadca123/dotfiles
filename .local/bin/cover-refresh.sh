#!/bin/bash

duration=20
img=/tmp/cover.png

display_cover(){
    kitty +kitten icat "$img" || chafa "$img"
    # [[ "$(cat /proc/$PPID/comm)" == 'kitty' ]] && kitty +kitten icat "$img"
}

while :; do
    music-cover-generate.sh
    clear

    display_cover
    sleep $duration
done
