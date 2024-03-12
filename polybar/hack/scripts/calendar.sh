#!/bin/sh

BAR_HEIGHT=22  # polybar height
BORDER_SIZE=1  # border size from your wm settings
YAD_WIDTH=222  # 222 is minimum possible value
YAD_HEIGHT=193 # 193 is minimum possible value
DATE=" $(date '+%A %H:%M')"

case "$1" in
--popup)
	if [ "$(xdotool getwindowfocus getwindowname)" = "yad-calendar" ]; then
		exit 0
	fi

	eval "$(xdotool getmouselocation --shell)"
	eval "$(xdotool getdisplaygeometry --shell)"

	: $((pos_x = WIDTH - YAD_WIDTH - BORDER_SIZE))
	: $((pos_y = BAR_HEIGHT + BORDER_SIZE))

	yad --calendar fixed --no-buttons \
		--width="$YAD_WIDTH" --height="$YAD_HEIGHT" --posx="$pos_x" --posy="$pos_y" \
		--title="yad-calendar" --borders=0 >/dev/null &
	;;
--close)
	if [ !"$(xdotool getwindowfocus getwindowname)" = "yad-calendar" ]; then
		exit 0
	fi
	pkill -f "yad-calendar"
	;;
*)
	echo "$DATE"
	;;
esac
