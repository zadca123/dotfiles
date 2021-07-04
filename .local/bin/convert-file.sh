#!/bin/bash
read -rp choose
for "$choose" in
    ebook)
        ebook-convert "$1" "${1%.*}.$2"
        ;;
    *)
        Usage: "$0" '[file/s] [format-to-convert]' 
        ;;
esac
