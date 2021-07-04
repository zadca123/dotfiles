#!/bin/bash

# This is the name of this script itself.
#
script="${0##*/}"

# The  arguments passed to this script are the parent
# directories to be searched, e.g: /home/me /usr/local
# Check if any given. If not, error out.
#
if [ -z "$1" ] ; then
    echo "Usage: $script <directory> [<directory>][...]" >&2
    exit 1
fi

# Create a temporary directory. For accurate results we need
# to be sure it is empty. This is one way to do this: create
# an temp dir that is garanteed to not exist yet.
#
# If you want to keep the "outputdir" with the results, make sure
# output dir you use does not contain files you want to keep, because
# files will be removed from it by this script! Better yet, make
# sure it is empty before starting this script.
#
outputdir=$(mktemp --tmpdir -d "${script}.XXXXXXXXXX")   # ensures new unique directory
trap "rm -r $outputdir" INT HUP QUIT ABRT ALRM TERM EXIT # ensures it is deleted when script ends

# Search the directories given as arguments, and process
# the paths of alle files one by one in a loop.
#
find "$@" -type f | while read path ; do
    filename="${path##*/}"
    echo "$path" >>"${outputdir}/${filename}.txt"
done

# Finally, if you want to end up with only file names that
# occur more than once, delete all output files that contain
# only one line.
#
for outputfile in $outputdir/*.txt ; do
    linecount=$(wc -l "$outputfile" | sed 's/ .*//')  # count lines in it
    if  [ "$linecount" = "1" ] ; then                 # if only one line
        rm "$outputfile"                              # remove the file
    fi
done

# Print the final result
#
for outputfile in $outputdir/*.txt ; do
    cat "$outputfile"
    echo               # empty line to separate groups of same file names
done
