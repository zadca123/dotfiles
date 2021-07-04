#!/bin/bash

# shift
case "$1" in
    gzip)
        shift
        pigz -9 -rv "$@"
        # gzip -9 -rv "${@:2}"
        # tar -czvf "$1" "${@:2}"
        # tar cvf - "${@:2}" | gzip -9 - > "$1"
        ;;
    zstd)
        shift
        zstd --ultra -22 -T0 -rv --rm "$@" #parallel zstd
        ;;
    *)
        echo Usage: "$0" '[gzip,zstd] [file/s, directory/ies]'
        ;;
esac
