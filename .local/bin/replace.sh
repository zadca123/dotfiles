#!/usr/bin/env bash

display_help(){
    echo "Usage: ${0##*/} [line-number-to-delete] [new-text-to-put-there] [file/s]"
    exit 1
}

[[ $# -lt 3 ]] && display_help

index="$1"
new_line="$2"
for i in "${@:2}"; do
    # sed "${index} c${new_line}" "$i" &>/dev/null #it's cat's output of file
    # sed -i "${index}s/.*/${new_line}/" "$i" 2>/dev/null || echo fail?
    # sed -i "${index}s/.*/${new_line}/" "$i"
    sed "${index} c${new_line}" "$i"
done

##Create temporary file with new line in place
#cat /dir/file | sed -e "s/the_original_line/the_new_line/" > /dir/temp_file
##Copy the new file over the original file
#mv /dir/temp_file /dir/file

# A little shorter: awk 'NR==4 {$0="different"} { print }' input_file.txt. – chepner Jun 21 '12 at 19:37
# 2
# @chepner: A little shorter: awk 'NR==4 {$0="different"}1' input_file.txt – Dennis Williamson Jun 21 '12 at 19:42 
# @DennisWilliamson, I don't even know how that works! What does that trailing 1 do? (Note: I tested it and it does indeed work! I just don't understand how.) – steveha Jun 21 '12 at 19:59
# 1
# I figured there'd be a way to abbreviate the unconditional print! @stevaha: the 1 is just a true value, meaning a "pattern" that always matches. And the default action for a match is to print the current line. – chepner Jun 21 '12 at 20:25 

# # To update/replace the new line string value with the exiting line of the file
# MyFile=/tmp/ps_checkdb.flag

# `sed -i "${index}s/.*/${newLine}/" $MyFile`
