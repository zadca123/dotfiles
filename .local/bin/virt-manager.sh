#!/bin/bash

pidof libvirtd || libvirtd
# virt-manager -c 'qemu:///session'

case $1 in
install)
	virt-install --connect qemu:///session --memory 4096 --vcpus 4 \
		--os-variant detect=on,name=win2k19 --network bridge=eth0 \
		--disk size="$2" --name "$3" --cdrom "$4";;
import)
	virt-install --import --memory 2048 \
		--os-variant detect=on,name=win2k19 \
		--disk "$3"
	;;
launch)
	virt-viewer --connect qemu:///session --domain-name "$1"
	;;
convert)
	sudo qemu-img convert -f vdi -O qcow2 "$2" "${2//.vdi}.qcow2"
	;;
*)
	echo "Usage: $0 install [size-for-vm] [name-of-vm] [iso]"
	echo "Usage: $0 import  [name] [path/to/image.qcow2]"
	echo "Usage: $0 launch  [name-of-vm]"
	echo "Usage: $0 convert [path/to/image.vdi]"
	;;
esac

# TODO
# qemu libvirt bridge-utils virt-manager virt-viewer
# videos
# https://www.youtube.com/watch?v=rI-7rgfB5iI&t=182s
# https://www.youtube.com/watch?v=jLRmVNWOrgo

# !!!CTRL + ALT to detach !!!

# things to do 
# sudo usermod -G libvirtd -a username

# jesli nie ma grupy trzeba ją stworzyć
# sudo addgroup libvirtd
# or
# sudo groupadd libvirtd

