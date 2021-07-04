#!/bin/bash

last="$HOME/.config/mpv/last_vid"
mpv "$(cat "$last")"

[ "$?" -eq 0 ] && exit
mpv "$1"
"$1" > "$last"

