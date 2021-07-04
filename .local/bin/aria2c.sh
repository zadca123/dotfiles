#!/bin/bash

# dtach -A aria2x aria2c -d /mnt/toshiba/torrents/aria2
# tmux -L tmux_aria2 aria2c -d $TORRENTS/aria2
# tmux new-window aria2c -d $TORRENTS/aria2

if [ "$#" -eq 1 ];then
	DIR="$HOME/.config/aria2/torrents"
	mkdir -p "$DIR" 2>/dev/null
	aria2c  --bt-metadata-only=true \
		--bt-save-metadata=true \
		--enable-dht \
		--listen-port=6800 \
		--dht-listen-port=6800 \
		-d "$DIR" "$1"

	mkdir -p /mnt/crucial_nvme/aria2 2>/dev/null
	aria2c 	--max-concurrent-downloads 10 \
		--continue \
		--bt-enable-lpd \
		--enable-dht \
		--listen-port=6800 \
		--dht-listen-port=6800 \
		-d "/mnt/crucial_nvme/aria2" "$DIR/*" 
else
	mkdir -p /mnt/crucial_nvme/aria2 2>/dev/null
	aria2c 	--max-concurrent-downloads 10 \
		--continue \
		--bt-enable-lpd \
		--enable-dht \
		--listen-port=6800 \
		--dht-listen-port=6800 \
		-d "/mnt/crucial_nvme/aria2" "$DIR/*" 
fi
