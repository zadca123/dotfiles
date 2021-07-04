#!/usr/bin/env bash

case "$1" in
    ls)
        ls --color=auto --group-directories-first -t
        ;;
    ll)
        ls --color=auto --group-directories-first -tlh
        ;;
    lt)
        ls --human-readable --size -1 -S --classify
        ;;
    exa)
        exa --icons --group-directories-first --sort=type
        ;;
    exl)
        exa --icons --group-directories-first --sort=changed --long --group --git --links
        ;;
    ext)
        exa --icons --group-directories-first --sort=size --long --no-permissions --no-user --no-time --git
        ;;
    *)
        echo Usage: "$0" '[ls,ll,lt,exa,exl,ext]'
        ;;
esac
