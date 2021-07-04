#!/bin/bash

# tmux new-window
# trans -tl pl -hl pl "$*"
# tmux split-window -h
# tuxi "$@"

case "$1" in
    pl | ru | de | en)
        trans -tl "$1" -hl "$1" "${*:2}"
        tuxi "${*:2}"
        ;;
    *)

        trans -tl pl -hl pl "$*"
        tuxi "$@"
        ;;
esac
