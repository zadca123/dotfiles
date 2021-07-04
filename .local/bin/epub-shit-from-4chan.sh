#!/usr/bin/env bash

file --mime-type -b -- "$1" | grep -q ^application/zip$ || { echo not application/zip ; exit 1 ;}

basedir="$(dirname -- "$1")" &&
original="$(basename -- "$1" .epub)" &&
cd -- "$basedir" &&
twd="$(mktemp -d -- "$original".XXXX)" &&
cd -- "$twd" &&
unzip -q ../"$original".epub &&
zip -0XrD -q out.epub mimetype &&
zip -0XrD -q out.epub * -x mimetype -x out.epub &&
mv out.epub ../"$original"_fix.epub &&
cd .. &&
rm -rf -- "$twd"

# I had a lot of epubs that were made incorrectly by whoever uploaded them to the internet.
# They claimed to be application/zip instead of application/epub+zip.
# So I had to fix them before reading them with certain apps. I copied how to do that from stackoverflow,
# then added just enough automation that it can be run from an external loop or 'find -exec'. 
# Remember: Epub is a zip, but it contains a mimetype file which must be added first and must not be
# compressed even if the other zipped files are compressed.
