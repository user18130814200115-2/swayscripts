#!/bin/sh
modspace() {
    change=$(printf "$1" | grep -P -o "change\":.*?,")
    
    case "$change" in
	*close*)
	    current_workspace=$(swaymsg -t get_workspaces | grep -B3 "focused\": true" | grep num | grep -o "[0-9]")	    
	    prev_workspace=$(expr $current_workspace - 1)
	    # See if the workspace is empty,
	    # You can do this with swaymsg, but it is easlier with lswt
	    [ $(lswt -t | cut -f5 | grep -c true) -lt 1 ] &&\
		echo "reached move" && [ $prev_workspace -gt 0 ] && swaymsg workspace $prev_workspace
	;;
    esac
}

while true; do
    message=$(swaymsg -t SUBSCRIBE '[ "window" ]') || exit
    modspace "$message" &
done
