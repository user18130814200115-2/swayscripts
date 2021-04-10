#!/bin/sh
while true; do
	swaymsg -t SUBSCRIBE '[ "window" ]' | grep "change\": \"fullscreen_mode" > /dev/null
	
	if [ $? -eq 0 ]
	then
		swaymsg -r -t get_tree | jq '.nodes[].nodes[].nodes' | grep "fullscreen_mode\": 1" && swaymsg bar mode hide || swaymsg bar mode dock
	fi
done
