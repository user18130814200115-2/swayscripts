#!/bin/sh

modbar() {
    change=$(printf "$1" | grep -P -o "change\":.*?,")
    
    case "$change" in
	*fullscreen_mode* | *focus*)
	    fullscreenmode=$(printf "$1" | grep -o "\"fullscreen_mode\": [0-9]")	
	;;
	*close*)
	    fullscreenmode=$(printf "$1" | grep -o "\"fullscreen_mode\": [0-9]" | tr "1" "0")	
	;;
	*new*)
	    [ ${fullscreenmode##*: } -eq 1 ] && notify-send "Fullscreen warning" "You opened a new window, but the focused one is in fullscreen"
	;;
    esac

	    echo "${fullscreenmode##*: }"

}

while true; do
    message=$(swaymsg -t SUBSCRIBE '[ "window" ]') || exit
    fullscreenmode=$(modbar "$message")
done

