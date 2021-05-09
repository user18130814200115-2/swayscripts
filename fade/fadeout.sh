#!/bin/sh

id=$(shuf -i 1-9999 -n 1)
swaymsg '[con_mark=quit]' "mark $id; unmark quit"
    
for i in `seq 20`; do
    swaymsg "[con_mark=$id]" opacity minus 0.05
    sleep 0.0001
done
    
swaymsg "[con_mark=$id]" kill
