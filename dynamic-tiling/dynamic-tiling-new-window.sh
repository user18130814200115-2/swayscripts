#!/bin/sh
workspace=$(swaymsg -p -t get_workspaces | grep "(focused)" | grep -o "[0-9]")
windows=$(swaymsg -t get_marks | grep -o "$workspace:[0-99]")
total=$(echo $windows | wc -w)

for i in $(seq $total); do
    echo "$i"
    current=$(echo "$windows" | head -n $i | tail -n 1)
    echo "$current"
    new="tmp:$workspace:$(expr ${current##*:} + 1)"
    echo $new
    swaymsg "[con_mark=$current]" mark $new
done

tmp=$(swaymsg -t get_marks | grep -o "tmp:[0-99]:[0-99]")
number=$(echo $tmp | wc -w)

for i in $(seq $number); do
    current=$(echo "$tmp" | head -n $i | tail -n 1)
    swaymsg "[con_mark=$current]" mark "${current##tmp:}"
done

swaymsg mark "$workspace:1"
swaymsg floating enable
swaymsg exec dynamic-tiling.sh
