#!/bin/bash

BOLD='\e[1;31m'         # Bold Red
REV='\e[1;32m'       # Bold Green
display_help(){
    echo -e "${BOLD}Usage:  [starting-location] [name-of-searching-file] ${OFF}"
    echo -e "${BOLD}Usage:${REV} $(basename $0) -e ~/Torrents/transmission_finished ${OFF}"
    echo -e "${REV}The following switches are recognized. ${OFF} "
    echo -e "${REV}-e ${BOLD}  --Searches and deletes empty files and directories in current of specified path ${OFF}"
    echo -e "${REV}-p ${BOLD}  --Searches for *.part files (unfinished transmission torrent) and deletes them (use with causion) ${OFF}"
    echo -e "${REV}-s +-=[size (in megabytes)] ${BOLD}  --Searches for files larger than specified size${OFF}"
    echo -e "${REV}-t +-=[days] ${BOLD}  --Searches for files modified from now to specified days back${OFF}"
    echo -e "${REV}-h${BOLD}  --Displays this help message. No further functions are performed.${OFF}"
    exit 2
}

[[ $# -lt 1 ]] && display_help
[[ -d $1 ]] && PWD="$1"
fd="find $PWD -mount"
# In case you wanted to check what variables were passed
# echo "flags = $*"
while getopts 'e:p:s:t:h' opt; do
    case $opt in
        e) $fd -empty -delete || $fd -empty -exec rm -r "{}" \; ;;
        p) $fd -type f -name "*.part$" -delete || $fd -type f -name "*.part" -exec rm "{}" \; ;;
        s) $fd -type f -size "${OPTARG}M" -exec du -h "{}" \; | sort -n;;
        # t) $fd -type f -mtime "-${OPTARG}" -exec sort -c '%y %n' "{}" \; | sort -n ;;
        t) $fd -type f -mtime "${OPTARG}" -exec ls -gort --full-time "{}" \; | sed 's/\..........//' |cut -d' ' -f4,5,7 ;;
        h)  display_help ;;
        :)  display_help ;;
        \?) #Untecognized option
            echo -e "Option -${BOLD}$OPTARG${OFF} not allowed."
            display_help 
            ;;
        *)  display_help ;;
    esac
done
