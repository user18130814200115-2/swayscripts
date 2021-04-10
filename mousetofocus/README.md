# swaymousefocus
Move the cursor to the center of the focused window in swaywm using ydotool.
I like to bind this to my movement keys in sway like so:
```
bindsym $mod+h focus left; exec swaymousefocus.sh
bindsym $mod+j focus down; exec swaymousefocus.sh
bindsym $mod+k focus up; exec swaymousefocus.sh
bindsym $mod+l focus right; exec swaymousefocus.sh
```
This is the same behaviour as `mouse_warping container`, but the script is more versitile, allowing for more diverse keybindings.

## Dependencies
- grep
- xargs
- sway
