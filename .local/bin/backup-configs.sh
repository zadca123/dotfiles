#!/bin/bash

dir="$HOME/Documents/files"
[[ -d $dir ]] || mkdir "$dir"

arc="${dir}/backup-configs_$(date +'%Y-%m-%d').tar.gz"
# cd "$HOME" || exit 2
# arc='test.tar.gz'
display_help(){
    echo usage not completed
    exit 2
}

case "$1" in
    create)
        tar czvpf - \
            ~/.icons \
            ~/.config/{cmus,*wm,i3*,neofetch,zathura,mimeapps.list} \
            ~/.*{wm,rc,conf,_profile,env} \
            ~/.local/{bin/*.sh,share/applications/*.desktop} \
            | gpg --symmetric --cipher-algo aes256 -o "${arc}.gpg"
        ;;
            # ~/.local/share/applications/[a-z]*.desktop \

    *.gpg)
        gpg -d "$@"  | tar xzvf -
        ;;

    *)  display_help
        ;;

esac

    # "$HOME/.dircolors " \
    # "$HOME/.rhistory " \
    # "$HOME/.Xdefaults" \


# tar czvf "$arc .icons .config/{audacious,i3,neofetch,{digikam,dolphin,kpat,soundkonverter}rc} .bash{rc,_aliases,_profile} .{input,screen,top,twm,vim}rc .dircolors .rhistory .Xdefaults"
