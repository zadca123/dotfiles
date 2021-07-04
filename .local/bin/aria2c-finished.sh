#!/bin/sh

echo "Called with [$1] [$2] [$3]"
$ aria2c --on-download-complete hook.sh http://example.org/file.iso
Called with [1] [1] [/path/to/file.iso]

