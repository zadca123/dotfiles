#!/bin/bash

packages_basic='vim neovim scrot nitrogen feh sxiv pcmanfm i3 dunst fzf vifm nnn cmus qutebrowser git wget unclutter zsh zsh-syntax-highlighting pulseaudio pulsemixer alacritty kitty xterm rxvt-unicode neofetch redshift aria2 rox'

packages_big='steam emacs remmina zathura transmission-remote-cli youtube-dl transmission-remote-gtk wine aerc translate-shell tk flameshot bpytop'

pacman="pacman -Syyuu && pacman -S --needed"
apt="apt update && apt upgrade && apt install"
case "$1" in
    basic)
        sudo "$@" "$packages_basic"
        ;;

    big) 
        sudo "$@" "$packages_big"
        ;;
    *)echo zjebales;;
esac
