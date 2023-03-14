#!/bin/sh

id=$(shuf -i 1-9999 -n 1)
swaymsg '[con_mark=fade]' "mark $id"

# TODO: Use args for fps and time values
FPS=60
TIME_S=0.1

frames=$(dc -e "$FPS $TIME_S * 1/ p")
step_time=$(dc -e "3k 1 $FPS / p")
step_opacity=$(dc -e "3k $step_time $TIME_S / p")

for i in `seq $frames`; do
    sleep $step_time

    swaymsg "[con_mark=$id]" opacity plus $step_opacity
done
    
swaymsg "[con_mark=$id]" opacity 1
