# fade
Have new windows fade in gradually.
This script is alpha (get it;)) at best, you may encounter issues.

## Usage
Add the lines from`sway.config` to your sway config file or `include` them and have `fadein.sh` and `fadeout.sh` in you `PATH`. Alternatively, you can just use either fade in or fade out.
You can tweak values of `FPS` and `TIME_S` to ajdust smoothness and time interval of the fade respectively.

## Example
![example gif](fade.gif)
![example gif2](fadeout.gif)

## Fadefix
There is an ocasional issue ([#2](https://github.com/user18130814200115-2/swayscrips/issues/2)) especially on slower devices where sway does not properly mark new windows,
making them remain transparent.
This script runs constantly in the background to fix this issue.
