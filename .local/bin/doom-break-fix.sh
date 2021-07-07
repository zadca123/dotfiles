#!/bin/bash

case "$1" in
    fix)
        # doom doctor && doom build
        cd ~/.emacs.d || notify-send 'wtf...' && exit
        rm -rf .local
        git pull
        bin/doom install
        ;;
    install)
        git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
        ~/.emacs.d/bin/doom install
        ;;
    *)
        echo wtf...
        ;;
esac
