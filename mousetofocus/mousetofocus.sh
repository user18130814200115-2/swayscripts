#!/bin/bash
raw=$(swaymsg -t get_tree | grep -B45 "focused\": true" | grep -A4 "\"rect\": {" | tail -n 4 | grep -o "[0-9]*[0-9]" | xargs) 

calculate() {
	mousex=$(expr $1 + $3 / 2)
	mousey=$(expr $2 + $4 / 2)
}

calculate $raw

swaymsg seat \* cursor set $mousex $mousey
