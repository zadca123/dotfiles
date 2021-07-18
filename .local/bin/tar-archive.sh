#!/bin/bash

# name="$(date +'%Y%m%d')"
fail() {
    echo "Archiving failed."
    notify-send -u normal "Archiving failed."
    exit 2
}
display_help(){
    echo Usage: "$0" '[archive-name.tar(,.gz,.bz2,.xz,.zst,.lzma,.lz)] [file/s]'
    echo Usage: "$0" '[list, unarchive] [file/s]'
    exit 2
}
[[ $# -lt 2 ]] && display_help

ext="$1"
shift 1
case "$ext" in
    *.7z)
        7z a -t7z -m0=lzma2 -mx=9 -aoa -mfb=64 -md=32m -ms=on "$ext" "$@" || fail
        ;;
    *.zip)
        zip -r9 "$ext" "$@" || fail
        # zip -r9 "$ext" shift "$@" || fail
        ;;
    *.tar)
        tar -cZvf "$ext" "$@" || fail
        ;;
    *.tar.gz) # gzip
        tar -c -I pigz -vf "$ext" "$@" || fail # parallel gzip
        # tar -czvf "$ext" "$@" || fail
        # tar cvf - "$@" | gzip -9 - > "$ext"
        ;;
    *.tar.bz2) # bzip2
        tar -c -I pbzip2 -vf "$ext" "$@" || fail # parallel bzip
        # tar -cjvf "$ext" "$@" || fail
        ;;
    *.tar.lzma)
        tar -c -I 'xz --format=lzma' -vf "$ext" "$@" || fail
        # tar -c -I lzma -vf "$ext" "$@" || fail
        ;;
    *.tar.xz) #xz is like never lzma
        tar -c -I 'pxz -9' -vf "$ext" "$@" || fail # parallel xz
        # tar -cJvf -9e "$ext" "$@" || fail
        # tar -cf - "$@" | xz -9 -c - > "$ext" # idk what is this
        ;;
    *.tar.zst)
        tar -c -I 'zstd --ultra -22 -T0' -vf "$ext" "$@" || fail #parallel zstd
        # tar -c -I 'zstd -19 -T0' -vf "$ext" "$@" || fail #parallel zstd
        # tar -I zstd -cvf "$ext" "$@" || fail
        ;;
    *.tar.lz)
        tar -c -I 'plzip -9' -vf "$ext" "$@" || fail #parallel lzip
        # tar -c --lzip -vf "$ext" "$@" || fail
        ;;
    list)
        tar -tvf "$@" || fail
        ;;
    unarchive)
        tar -xvf "$@" || fail
        ;;
    *) display_help;;
esac
