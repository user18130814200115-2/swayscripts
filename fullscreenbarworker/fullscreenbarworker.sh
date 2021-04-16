#!/bin/sh
while true; do
    message=$(swaymsg -t SUBSCRIBE '[ "window" ]') || exit
    fullscreenmode=$(echo "$message" | grep "change\": \"fullscreen_mode" | grep -o "\"fullscreen_mode\": [0-9]")	

    if [ -n "$fullscreenmode" ]; then
	[ ${fullscreenmode##*:} -eq 1 ] && swaymsg bar mode hide
	[ ${fullscreenmode##*:} -eq 0 ] && swaymsg bar mode dock
    fi
done

