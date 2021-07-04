#!/bin/bash

br='master'
gdir="$HOME/Dotfiles"
gitdots="git --git-dir=$gdir --work-tree=$HOME"

case "$1" in
    -n | --new-repo)
        mkdir -p "$gdir"
        git init --bare "$gdir"
        $gitdots config --local status.showUntrackedFiles no
        echo "# +TITLE: Dotfiles" >> "$HOME/README.org"
        $gitdots add README.org
        $gitdots commit -m 'first commit'
        $gitdots branch -M "$br"
        $gitdots remote add origin "https://github.com/zadca123/Dotfiles.git"
        $gitdots commit -a -m 'using script to do this stuff'
        $gitdots push -u origin "$br"
        ;;
    -u | --update)
        $gitdots commit -a -m 'updating dotfiles'
        $gitdots push -u origin "$br"
        ;;
    --add-basic)
        shift
        $gitdots add \
            ~/.icons \
            ~/.config/{nvim,mpv,transmission-daemon,cmus,*wm,i3*,qtile,awesome,alacritty,picom,neofetch,zathura,mimeapps.list,compton.conf} \
            ~/.*{Xresources,wm,rc,conf,_profile,env,password*} \
            ~/.local/{bin,share/applications/[a-z]*.desktop}

#         list=$(find "$HOME" -mount -type f \( -iname "*cache*" -o -iname "*hist*"\))
#         $gitdots rm -r --cached \
        ;;
    -d | --delete)
        shift 1
        $gitdots rm -r --cached "$@";;
    -df | --delete-force)
        shift 1
        $gitdots rm -rf --cached "$@";;
    "") $gitdots status;;
    *) $gitdots "$@";;
esac
