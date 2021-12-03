#!/bin/sh

while [ $(pgrep -c sway) -gt 0 ];do
    [ $(swaymsg -t get_tree | tr "\n" " " | grep -c "\"marks\": \[               \],               \"focused\": true,") -gt 0 ] && swaymsg mark fade
    swaymsg exec fadein.sh
    sleep 1
done
