#!/bin/sh

gapsize=2
sx=0
sy=0
w=1910
h=1043

workspace=$(swaymsg -p -t get_workspaces | grep "(focused)" | grep -o "[0-9]")
windows=$(swaymsg -t get_marks | grep -o "$workspace:[0-99]")
total=$(echo $windows | wc -w)
stacksize=$(expr $total - 1)
stackwidth=$(expr $w / 2) 

swaymsg "[con_mark=.*]" floating enable
[ $total -gt 1 ] &&\
    swaymsg "[con_mark=$workspace:1] resize set $stackwidth $h; [con_mark=$workspace:1] move position 0 0" ||\
    swaymsg "[con_mark=$workspace:1] resize set $w $h; [con_mark=$workspace:1] move position 0 0"

swaymsg "[con_mark=$workspace:1]" opacity 1 
stackheight=$(expr $h / $stacksize)

echo "$windows" | while read line ; do
    number=$(echo "$line" | cut -d: -f2)
    stackpos=$(expr $number - 2)
   [ $number -gt 1 ] &&\
	swaymsg "[con_mark=$line]" resize set "$stackwidth $stackheight" &&\
	swaymsg "[con_mark=$line]" move position $(expr "$stackwidth" + "$gapsize") $(expr "$stackheight" \* "$stackpos" + "$(expr $gapsize \* $stackpos)")
	swaymsg "[con_mark=$line]" opacity 1

done
