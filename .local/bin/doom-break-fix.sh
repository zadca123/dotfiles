#!/bin/bash

cd ~/.emacs.d || notify-send 'wtf...' && exit
rm -rf .local
git pull
bin/doom install
