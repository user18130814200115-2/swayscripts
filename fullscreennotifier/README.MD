# Fullscreen notifier
If you open a new window, while the current one is fullsrceened,
send a notification.

You can of course easlily edit this to unfullscreen the window instead of sending a notification.

## Usage
Just add the script to your `PATH` and run it in the background,
you can do this by adding the following line to your sway config
`exec fullscreennotifier.sh`

## Dependencies
- A posix shell (bash, dash, ksh)
  - printf
- Grep
- Sway
