#!/bin/bash

for a in ./*.ogg; do
  < /dev/null ffmpeg -i "$a" -qscale:a 0 "${a[@]/%ogg/mp3}"
done

