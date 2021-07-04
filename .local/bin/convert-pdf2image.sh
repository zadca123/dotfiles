#!/bin/bash

	# inkscape -D "$1" --export-type="$2"
# $ for i in {1..10}; do  ./Inkscape-2b71d25-x86_64.AppImage input_file.pdf -z
# --export-dpi=300 --export-area-page --pdf-page=$i --export-file="output-$i.png";
# done
	# convert -density 150 "$1" -quality 100 "${1//.pdf}.$2"
# 1st method: poppler   

if [ "$#" -eq 2 ];then
    pdftoppm -"$2" "$1" "${1%.pdf}"
else
	echo Usage: "$0" '[file] [format-to-convert]'
fi
