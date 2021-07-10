#!/bin/bash

delete-empties () {
    find . -empty -delete
}

delete-empty-dirs () {
    find . -type d -empty -exec command rm -vrf {} \;
}
##!/bin/bash

#if [ $# -eq 1 ];then
#	# find $1 -mount -type d -empty -exec rmdir "{}" \;
#	# However, even with this, it will just do a single 
#	# round of search and remove directories that are empty,
#	# but it will not remove directories that become empty after 
#	# the first round of deletion.
#	find "$1" -mount -type d -empty -exec -delete \;
#else
#	echo Usage: "$1" '[starting-location]'
#fi
