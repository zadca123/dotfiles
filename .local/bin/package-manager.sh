#!/bin/bash
display_help(){
    echo Works with: pacman, paru, apt
    echo -e "What you want to do? (example: i steam vim) \\n" \
        "I,i) - install \\n" \
        "D,d) - delete \\n" \
        "U,u) - update \\n" \
        "R,r) - remove \\n" \
        "C,c) - clear cache \\n" \
        "S,s) - list installed \\n" \
        "L,l) - list regex"
}
display_help
read -rp "Type here: " choice x

[[ -f /bin/pacman ]] && \
    case "$choice" in 
        i) sudo pacman -S --noconfirm --needed "$x" ;;
        I) paru -S --noconfirm --needed "$x" ;;
        D|d) sudo pacman -Rncssu "$x" ;;
        u)  sudo pacman -Syy && pacman -Qu | grep nvidia
            if "$?" -ne 0 ;then
                echo No nvidia packages, updating...
                sudo pacman -Suu && notify-send "Update Copleted"
            else
                echo Nvidia packages are present, manual update is required
            fi
            ;;
        U) paru -Syyuu --needed && notify-send "Update Copleted";;
        R|r) sudo pacman -Rnssu "$x";;
        c) sudo pacman -Scc;;
        C) paru -Scc  ;;
        S|s) pacman -Qs "$x";;
        l) pacman -Ss "$x";;
        L) paru --sortby popularity --bottomup "$x";;
        *)  display_help && exit ;;
    esac && exit

[[ -f /bin/apt ]] && \
    case "$choice" in 
        I|i) sudo apt install "$x" ;;
        D|d) sudo apt remove "$x"
            # sudo apt purge "$x" # deletes package with configuration
            ;;
        U|u) sudo apt update && sudo apt upgrade && notify-send "Update Copleted";;
        C|c) sudo apt autoremove ;;
        S|s) apt show "$x";;
        L|l) apt search "$x"
            # apt list "$x" grep -v "\[.*\]"
            ;;
        *)  display_help && exit ;;
    esac

