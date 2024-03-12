#!/bin/sh

get_options() {
	echo "emojis"
	echo "asciimojis"
}

case "$1" in
--popup)
	~/.config/scripts/rofi/src/mojis
	;;
*)
	echo "♥"
	;;
esac
