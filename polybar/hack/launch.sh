#!/usr/bin/env bash
DIR="$HOME/.config/polybar/hack"

killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
	MONITOR=$m polybar --reload top_bar &
	# MONITOR=$m polybar --reload bottom_bar &
done
