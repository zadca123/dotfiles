#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Start x on login
if [[ -z $DISPLAY && ! -e /tmp/.X11-unix/X0 ]]; then
   exec startx
fi
# export PS1="\[\033[42m\]\[\033[31m\]\u@\h:\w\$ "
export PS1="\e[0;32m[\u@\h \W]\$ \e[0m"

## mx linux prompt
# export PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
# export PS1="\[\e]0;\u@\h: \w\a\]"

# # # Load aliases and shortcuts if existent.
[ -f "$HOME/.aliasrc" ] && source "$HOME/.aliasrc"
# # [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/aliasrc"
# # [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shortcutrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shortcutrc"
# # [ -f "${XDG_CONFIG_HOME:-$HOME/.config}/zshnameddirrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/zshnameddirrc"

# vi mode
set -o vi

source /home/zadca123/.config/broot/launcher/bash/br

eval "$(starship init bash)"
