#!/bin/bash

# # I successfully cleared 3.5 GB by removing old headers and images.
# # Please note on some systems this also attempts to remove the current kernel which is not a great idea - see comments below for how to check.
# # I used the following command:
# dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | xargs sudo apt-get -y purge

# You can check what packages will be purged executing the first part of the command:
dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d'
