#!/bin/bash

export PATH="$PATH:$HOME/.local/bin:$HOME/.local/share/applications"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"

export EDITOR="nvim"
export VISUAL="nvim"
export BROWSER="vimb"
export READER="zathura"
export OPEN="xdg-open"
export PAGER="w3m"

export NNN_TRASH=1
export NNN_PLUG='i:imgthumb;m:mocplay;t:preview-tui;n:nuke;d:dragdrop'
export NNN_FIFO='/tmp/nnn.fifo'
#export NNN_OPENER="$XDG_CONFIG_HOME/nnn/plugins/nuke"
# export NNN_OPENER=nuke

[[ -f ~/.bashrc ]] && . ~/.bashrc

#if [ "$(tty)" = "/dev/tty1"]; then
#	pgrep -x herbstluftwm || exec startx
#fi

source /home/zadca123/.config/broot/launcher/bash/br
