#!/bin/bash

delay=30
IFS=$'\n';

LIST=$(find "$1" -type f \( -name '*,png' -o -name '*.jpg' \) | shuf)
# zrobić coś ze zapisuje liste do pliku i usuwa rekord po każdej tapecie by pamiętało po wyłączeniu kompa i były za każdym razem inna tapeta
# [ -s /tmp/file.txt ] $$ echo File not empty || echo File empty
if [ "$#" -ge 1 ];then
    for i in "$@";do
        echo Setting "$i" as wallpaper...
        feh "$i" --bg-fill
        sleep "${delay}m"
        # mkdir "${i%\/*}/../seen"
        # mv "$i" "${i%\/*}/../seen"
    done
else
    echo Usage: "$0" '[path-to-wallpapers]'
fi
