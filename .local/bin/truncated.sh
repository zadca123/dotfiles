#!/usr/bin/env sh
# return stylized/truncated pathname

# no such file or directory
[ ! -z "$PWD" ] || exit 1

# truncate pathnames in $HOME with ~/ prefix
[ "$HOME" = "${PWD%"${PWD##"$HOME"}"}" ] && PWD="~${PWD##"$HOME"}"

# truncate long pathnames to last N chars
# dynamically generate parameter expansion wildcard
size=$((${#PWD} - ${PATH_WIDTH:-50}))
i=0; while [ $i -lt $size ]; do
    wildcard="${wildcard}?"
    i=$((i + 1))
done

# denote truncated path, ignore leading spaces
path="${PWD#$wildcard}"
[ "$PWD" = "$path" ] || path="..${path# }"
echo "$path"
