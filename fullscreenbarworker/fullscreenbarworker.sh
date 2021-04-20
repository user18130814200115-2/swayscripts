#!/bin/sh

modbar() {
    fullscreenmode=$(echo "$1" | grep "change\": \"fullscreen_mode" | grep -o "\"fullscreen_mode\": [0-9]")	
    [ -z "$fullscreenmode" ] && fullscreenmode=$(echo "$1" | grep "change\": \"close" | grep -o "\"fullscreen_mode\": [0-9]" | tr "1" "0")
    
    if [ -n "$fullscreenmode" ]; then
	[ ${fullscreenmode##*:} -eq 1 ] && swaymsg bar mode hide
	[ ${fullscreenmode##*:} -eq 0 ] && swaymsg bar mode dock
    fi
}

while true; do
    message=$(swaymsg -t SUBSCRIBE '[ "window" ]') || exit
    modbar "$message" &
done

