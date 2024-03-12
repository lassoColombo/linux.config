#!/bin/sh

case "$1" in
--popup)
	/usr/bin/arandr
	;;
*)
	echo ""
	;;
esac
