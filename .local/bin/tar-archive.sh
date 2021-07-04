#!/bin/bash

# shift
name="$(date +'%Y%m%d')"
case "$1" in
    *.7z)
        7z a -t7z -m0=lzma2 -mx=9 -aoa -mfb=64 -md=32m -ms=on "$1" "${@:2}"
        ;;
    *.zip)
        zip -r9 "$1" "${@:2}"
        # zip -r9 "$1" shift "$@"
        ;;
    *.tar)
        tar -cZvf "$1" "${@:2}"
        ;;
    *.tar.gz) # gzip
        tar -c -I pigz -vf "$1" "${@:2}" # parallel gzip
        # tar -czvf "$1" "${@:2}"
        # tar cvf - "${@:2}" | gzip -9 - > "$1"
        ;;
    *.tar.bz2) # bzip2
        tar -c -I pbzip2 -vf "$1" "${@:2}" # parallel bzip
        # tar -cjvf "$1" "${@:2}"
        ;;
    *.tar.lzma)
        tar -c -I 'xz --format=lzma' -vf "$1" "${@:2}"
        # tar -c -I lzma -vf "$1" "${@:2}"
        ;;
    *.tar.xz) #xz is like never lzma
        tar -c -I 'pxz -9' -vf "$1" "${@:2}" # parallel xz
        # tar -cJvf -9e "$1" "${@:2}"
        # tar -cf - "${@:2}" | xz -9 -c - > "$1" # idk what is this
        ;;
    *.tar.zst)
        tar -c -I 'zstd --ultra -22 -T0' -vf "$1" "${@:2}" #parallel zstd
        # tar -c -I 'zstd -19 -T0' -vf "$1" "${@:2}" #parallel zstd
        # tar -I zstd -cvf "$1" "${@:2}"
        ;;
    *.tar.lz)
        tar -c -I 'plzip -9' -vf "$1" "${@:2}" #parallel lzip
        # tar -c --lzip -vf "$1" "${@:2}"
        ;;
    list)
        tar -tvf "${@:2}"
        ;;
    unarchive)
        tar -xvf "${@:2}"
        ;;
    *)
        echo Usage: "$0" '[archive-name.tar(,.gz,.bz2,.xz,.zst,.lzma,.lz)] [file/s]'
        echo Usage: "$0" '[list, unarchive] [file/s]'
        ;;
esac
