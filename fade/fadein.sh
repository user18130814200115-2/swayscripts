#!/bin/sh

id=$(shuf -i 1-9999 -n 1)
swaymsg '[con_mark=fade]' "mark $id"
    
for i in `seq 30`; do
    sleep 0.001
    swaymsg "[con_mark=$id]" opacity plus 0.03
done
    
swaymsg "[con_mark=$id]" opacity 1
