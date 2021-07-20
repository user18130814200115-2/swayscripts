# Dynamic tiling
## Important note
These scripts are more a proof of concept than an actual functional system.
My aim was to create a simple master-stack layout, which is what I achieved.

## Missing features
- resizing windows
- (easy) custom settings for stack size bar height etc.
- Intuitive movement through the stack
  + Normal sway movement works
  + A simple script can be written to get the current stack position of a window and move up or down one
- Manually reordering the stack
  + A simple script can be written to get the current stack position of a window and move up or down one

## Known problems
- floating windows are put back into the stack when a new window is spawned or if one is closed
  + this can be remedies by giving floating windows another mark
- windows that close by means other than the Mod+Shift+Q binding do not update the stack, thus breaking everything
  + this can be remedies by writing a better script that watches the IPC close events
- there is a bit of window flicker and delay when spawning and closing windows
  + this may only be a problem on slower machines

## Usage
Make sure all three scripts are in your path and include the lines in `sway.config` in your config file.

You might have to ajust some varaibles in `dynamic-tiling.sh` to for specific screen sizes and bar/dock areas.

## How the scripts function
`dynamic-tiling-new-window.sh` gives a newly spawned window the mark `[workspacenumber]:1` all other marked windows are moved down one position in the stack by marking them `[workspacenumber]([old]+1)`.

`dynamic-tiling-close-window.sh` closes a window and moves all the windows below it in the stack up one position.

`dynamic-tiling.sh` organises the windows based on their stack position (known by their mark). This is achieved by putting all windows in floating mode so that their exact position and size can be set.
