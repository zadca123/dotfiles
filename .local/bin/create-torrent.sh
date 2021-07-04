#!/bin/bash

# trackers='udp://tracker.openbittorrent.com:80 http://nyaa.tracker.wf:7777/announce'
# for i in $trackers;do
# done
if [ "$#" -ge 2 ];then
    transmission-create -o "${1%.*}.torrent" -t 'udp://tracker.openbittorrent.com:80' -t 'http://nyaa.tracker.wf:7777/announce' "${@:2}"
else
    echo Usage: "$0" '[torrent-name] [file/s]'
fi
