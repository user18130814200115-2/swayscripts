#!/bin/sh

modbar() {
    change=$(echo "$1" | grep -P -o "change\":.*?,")
    
    case "$change" in
	*fullscreen_mode* | *focus*)
	    fullscreenmode=$(echo "$1" | grep -o "\"fullscreen_mode\": [0-9]")	
	;;
	*close*)
	    fullscreenmode=$(echo "$1" | grep -o "\"fullscreen_mode\": [0-9]" | tr "1" "0")	
	;;
    esac

    if [ -n "$fullscreenmode" ]; then
	[ ${fullscreenmode##*:} -eq 1 ] && swaymsg bar mode hide
	[ ${fullscreenmode##*:} -eq 0 ] && swaymsg bar mode dock
    fi
}

while true; do
    message=$(swaymsg -t SUBSCRIBE '[ "window" ]') || exit
    modbar "$message" &
done

