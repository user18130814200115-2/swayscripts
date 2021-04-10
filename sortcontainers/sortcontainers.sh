#!/bin/sh

swaymsg [workspace=__focused__] floating enable


swaymsg focus floating, floating disable
swaymsg focus floating, floating disable

swaymsg [tiling] splitv

swaymsg focus floating, floating disable
swaymsg focus floating, floating disable, move left

swaymsg [floating] floating disable
