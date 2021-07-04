#!/bin/sh

transmission-init.sh

[ "$#" -eq 1 ] && \
    transmission-remote --no-start-paused --add "$*" && \
    notify-send "Transmission-daemon" "Torrent added (started)." && \
    exit                                                        

[ "$#" -ge 2 ] && \
    case "$1" in
        paused)
            transmission-remote --start-paused --add "$*"
            notify-send "${*} added (paused)"
            ;;
        started)
            transmission-remote --no-start-paused --add "$*"
            notify-send "${*} added (started)"
            ;;
        *)
            echo "Usage: ${0##*/} [paused, started] [torrent/s]"
            ;;
    esac

# if [ "$#" -ge 2 ];then
#     transmission-remote --no-start-paused --add "$@"
#     transmission-remote --start-paused --add "$@"
# else
    
# if
