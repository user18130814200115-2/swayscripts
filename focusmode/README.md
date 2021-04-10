# focusmode
A script to stay focused in the sway window manager (can be adapted for i3).
This system consists of two parts, a script and a section in your sway config.
"Focus Mode" will not allow you to leave a certain application. In my case it is a chromium window without a tab or url bar.

## Usage 
`focus [number of minutes]`  
You will be swiched to a different workspace and launched into a full screen app which you cannot leave untill the timer expires.

## Depecndncies

- sway (can be adapted for i3)
- [notify-send.sh](https://github.com/vlevit/notify-send.sh) normal notify-send or dunstify etc. can also be used.
- By default, the launched app is chromium
