#!/usr/bin/env bash

ls="ls --color=auto --group-directories-first"
exa="exa --icons --group-directories-first"
while getopts 'nlth' opt; do
      case "${opt}" in
          n)
              $ls -t
              $exa --sort=type
              ;;
          l)
              $ls -tlh
              $exa --sort=changed --long --group --git --links
              ;;
          t)
              ls --human-readable --size -1 -S --classify
              $exa --sort=size --long --no-permissions --no-user --no-time --git
              ;;
          h|:|\?|*)
              echo Usage: "$0" '[ls,ll,lt,exa,exl,ext]'
              ;;
      esac
done
