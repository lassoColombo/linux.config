#!/bin/sh

case "$1" in
--proxmox)
	~/.config/scripts/work/src/drift --proxmox
	;;
--ilo)
	~/.config/scripts/work/src/drift --ilo
	;;
--proxmox-icon)
	echo " prox"
	;;
--ilo-icon)
	echo " ilo"
	;;
esac
