#!/bin/sh
focused=$(swaymsg -t get_tree | grep "focused.: true" -B2 | grep -o "[0-99]:[0-99]")
number=${focused##*:}
workspace=$(swaymsg -p -t get_workspaces | grep "(focused)" | grep -o "[0-9]")
windows=$(swaymsg -t get_marks | grep -o "$workspace:[0-99]")
total=$(echo $windows | wc -w)

for i in $(seq $total); do
    current=$(echo "$windows" | head -n $i | tail -n 1)
    new="tmp:$workspace:$(expr ${current##*:} - 1)"
    echo "$current\n$new"
    [ ${current##*:} -gt $number ] &&\
	swaymsg "[con_mark=$current]" mark $new
done

tmp=$(swaymsg -t get_marks | grep -o "tmp:[0-99]:[0-99]")
number=$(echo $tmp | wc -w)

for i in $(seq $number); do
    current=$(echo "$tmp" | head -n $i | tail -n 1)
    swaymsg "[con_mark=$current]" mark "${current##tmp:}"
done

sleep 0.05

swaymsg mark closed
swaymsg exec ~/.local/bin/swayscripts/dynamic-tiling.sh
swaymsg "[con_mark=closed]" kill

