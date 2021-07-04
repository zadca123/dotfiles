#!/bin/sh

# notify-send "Now Playing" "$(mpc status | grep -q playing && \
#     mpc status | sed 1q || echo "Nothing playing")" \
#     -i $(mpc status | grep -q playing && \
#     echo "/tmp/cover.png" || echo "?")

# $(music_notify_cover.sh)
# notify-send "Now Playing" "$(cmus-remote -C status | grep -q playing && \
#     cmus-remote -C status | sed 1q || echo "Nothing playing")" \
#     -i $(cmus-remote -C status | grep -q playing && \
#     echo "/tmp/cover.png" || echo "?")

$(music_notify_cover.sh)
notify-send "Now Playing" "$(cmus-remote -C status | grep -q playing && \
    cmus-remote -C status | awk '$2=="artist" {$1=$2="";print substr($0,3)}' && \
    cmus-remote -C status | awk '$2=="title" {$1=$2="";print substr($0,3)}' || echo "Nothing playing")" \
    -i $(cmus-remote -C status | grep -q " " && \
    echo "/tmp/cover.png" || echo "?")
