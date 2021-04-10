#!/bin/sh

# move to a dedicated workspace
swaymsg workspace focus

# Open desired app
chromium --app="file:///home/user/Documents/bookmarks.html" &

# Countdown
for i in `seq 5`; do
        notify-send.sh --replace-file=/tmp/focusnotification "starting focus mode in `expr 5 - $i`"
        sleep 1
done

# Enter fullscreen
swaymsg fullscreen toggle

# Switch to focus mode with limited keybindings
swaymsg mode "focus"

# Hide the bar just in case
swaymsg bar mode invisible

# Calculate and wait for the set number of minutes
minute=`expr $1 '*' 60`
sleep $minute

# Return to normal
swaymsg mode "default"
swaymsg bar mode dock
