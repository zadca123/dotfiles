#!/bin/bash

# tmux attach || tmux new-session -As0 -n Music -c "$HOME" \; \
#   send-keys -t Music 'cmus' 'Enter' \; \
#   split-window -t Music -h \; \
#   resize-pane -t Music -R 10 \; \
#   send-keys -t Music 'cover-refresh.sh' 'Enter' \; \
#   split-window -t Music -fv \; \
#   resize-pane -t Music -D 25 \; \
#   send-keys -t Music 'cava' 'Enter' 'Right' 'f' 'f' 'f'

tmux attach || \
    tmux new-session -As0 -n Music -c "$HOME" \; \
    send-keys -t Music 'cmus' 'Enter' \; \
    split-window -t Music -h \; \
    resize-pane -t Music -R 10 \; \
    send-keys -t Music 'cover-refresh.sh' 'Enter' \; \
    split-window -t Music -fv \; \
    resize-pane -t Music -D 25 \; \
    send-keys -t Music 'cava' 'Enter' 'Right' 'f' 'f' 'f'
