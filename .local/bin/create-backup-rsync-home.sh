#!/bin/bash

# # fix that home folder bullshit
# list=$(find /home -maxdepth 2 -name "\.*")
# sudo mkdir -p "$1"

# for x in $list ;do
# 	sudo rsync -ahzAxmivP --delete --delete-excluded --max-size=2m \
# 		--exclude='*[Cc][Aa][Cc][Hh][Ee]*' \
# 		--exclude='*[Ss][Rr][Cc]*' \
# 		--exclude='*[Ss][Oo][Uu][Rr][Cc][Ee]*' \
# 		--exclude='*[Tt][Ee][Mm][Pp]*' \
# 		--exclude='*[Ss][Ww][Aa][Pp]*' \
# 		--exclude='*[Ss][Tt][Ee][Aa][Mm]*' \
# 		--exclude='*[Ll][Oo][Gg]*' \
# 		--exclude='*[Mm][Ii][Cc][Rr][Oo][Ss][Oo][Ff][Tt]*' \
# 		--exclude='*[Tt][Rr][Aa][Ss][Hh]*' \
# 		"$x" "$1"  2>&1 | tee -a "$HOME/rsync-output.txt"
# done

# [[ -d "$1" ]] && \
# sudo rsync -ahzAxmivP --delete --delete-excluded --max-size=2m \
# 	--include='*/' \
# 	--include='\.[a-z]*' \
# 	--exclude='*[Cc][Aa][Cc][Hh][Ee]*' \
# 	--exclude='*[Ss][Rr][Cc]*' \
# 	--exclude='*[Ss][Oo][Uu][Rr][Cc][Ee]*' \
# 	--exclude='*[Tt][Ee][Mm][Pp]*' \
# 	--exclude='*[Ss][Ww][Aa][Pp]*' \
# 	--exclude='*[Ss][Tt][Ee][Aa][Mm]*' \
# 	--exclude='*[Ll][Oo][Gg]*' \
# 	--exclude='*[Mm][Ii][Cc][Rr][Oo][Ss][Oo][Ff][Tt]*' \
# 	--exclude='*[Tt][Rr][Aa][Ss][Hh]*' \
# 	--exclude='*' \
# 	/home "$1" 2>&1 | tee -a "$HOME/rsync-output.txt" && exit
# echo Nie podano poprawnie katalogu

if [ -d "$1" ]; then
    list=$(find "/home/$USER" -maxdepth 1 -type d  -name '\.*')
    for i in $list; do
        sudo rsync -ahzAxmivP --delete --delete-excluded --max-size=2m \
            --exclude='*[Cc][Aa][Cc][Hh][Ee]*' \
            --exclude='*[Ss][Rr][Cc]*' \
            --exclude='*[Ss][Oo][Uu][Rr][Cc][Ee]*' \
            --exclude='*[Tt][Ee][Mm][Pp]*' \
            --exclude='*[Ss][Ww][Aa][Pp]*' \
            --exclude='*[Ss][Tt][Ee][Aa][Mm]*' \
            --exclude='*[Ll][Oo][Gg]*' \
            --exclude='*[Mm][Ii][Cc][Rr][Oo][Ss][Oo][Ff][Tt]*' \
            --exclude='*[Tt][Rr][Aa][Ss][Hh]*' \
            --exclude='*[nt][Rr][Aa][Ss][Hh]*' \
            "$i" "$1" 2>&1 | tee -a "$HOME/rsync-output.txt"
        done
    else
        echo Nie podano poprawnie katalogu
fi

# rsync include exclude pattern examples:
# "*"         means everything
# "dir1"      transfers empty directory [dir1]
# "dir*"      transfers empty directories like: "dir1", "dir2", "dir3", etc...
# "file*"     transfers files whose names start with [file]
# "dir**"     transfers every path that starts with [dir] like "dir1/file.txt", "dir2/bar/ffaa.html", etc...
# "dir***"    same as above
# "dir1/*"    does nothing
# "dir1/**"   does nothing
# "dir1/***"  transfers [dir1] directory and all its contents like "dir1/file.txt", "dir1/fooo.sh", "dir1/fold/baar.py", etc...
