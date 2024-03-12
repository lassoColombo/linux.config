#!/bin/sh

case "$1" in
--popup)
	rofi -show ssh -theme $HOME/.config/rofi/launchers/ssh/style.rasi
	;;
*)
	echo " ssh"
	;;
esac
