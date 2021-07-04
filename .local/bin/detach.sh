#!/bin/bash
# mkdir -p ~/launch
# logfilename="${1##*/}_$(date +%F_%H:%M:%S,%N)"
# echo "== LAUNCH $@ ==" > ~/launch/${logfilename}_stdout.log
# echo "== LAUNCH $@ ==" > ~/launch/${logfilename}_stderr.log
# nohup "$@" >>~/launch/${logfilename}_stdout.log 2>>~/launch/${logfilename}_stderr.log &


mkdir -p /tmp/launch
logfilename="${1##*/}_$(date +%F_%H:%M:%S,%N)"
echo "== LAUNCH $@ ==" > /tmp/launch/${logfilename}_stdout.log
echo "== LAUNCH $@ ==" > /tmp/launch/${logfilename}_stderr.log
nohup "$@" >>/tmp/launch/${logfilename}_stdout.log 2>>/tmp/launch/${logfilename}_stderr.log &
