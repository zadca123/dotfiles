#!/bin/bash

# git=""

# case "$1" in
#     init | add | pull | push | commit | remote |delete | list)
#         ;;
#     *)
    #         echo script not finished
    #         echo Learn eval
    #         ;;
    # esac

# alias g="/usr/bin/git --git-dir=$HOME/Dotfiles/ --work-tree=$HOME"
# alias gdl="git clone https://github.com/zadca123/dotfiles"
# alias gdt="git clone https://gitlab.com/dwt1/dotfiles"
display_help(){
    echo "Usage: ${0##*/} -[n|u]"
    echo "--new-repo [n]"
    echo "--update [u]"
    exit 2
}

[[ "$#" -lt 1 ]] && display_help
# opts=('clone','init',\
#     'add','mv','restore','rm','sparse-checkout',\
#     'bisect','diff','grep','log','show','status'\
#     'branch','commit','merge','rebase','reset','switch','tag'\
#     'fetch','pull','push')

br='master'
case "$1" in
    -u | --update)
        git commit -a -m 'updating files'
        git status
        git push -u origin "$br"
        # || sh "$0" create-new-remote
        ;;
    -n | --new-repo)
        read -rp "github username: " u
        read -rp "github project name: " p
        # read -rp "github branch name (def master): " br
        # [[ $br == "" ]] && br="master"

        git init
        # hub create "${u}/${p}"
        echo -e "# +TITLE: ${p}\\n* ${p}" >> README.org
        git add README.org
        git commit -m 'first commit'
        git branch -M "$br"
        git remote add origin "https://github.com/${u}/${p}.git"
        git commit -a -m 'using script to do this stuff'
        git push -u origin "$br"
        ;;
    *)  display_help;;
esac
