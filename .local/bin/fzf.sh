#!/bin/bash

case "$1" in
    bat)
        fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'
        ;;
    chafa)
        fzf --preview 'chafa {}'
        ;;
    audio)
        fzf --preview 'ffplay -nodisp -autoexit {}'
        # fzf --preview 'mpv --no-audio-display {}'
        ;;
    *)
        echo Usage: "$0" '[bat, chafa, ffplay]'
        ;;
esac
