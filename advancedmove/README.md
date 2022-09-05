Advanced move is a script degined to be bound to the movement keys (not the focus keys).
If one calls `advancedmove.sh right` one of two things happen:

1. If there is a window to the right of the currently focused one, that window and the current one will be swapped.
2. If there is no window to the right of the currently focused one, the normal sway `move` command will be initiated.

## Examples
X and Y are windows

`advancedmove.sh right`  
before
```
x
y

```
after
```
x y
```

`advancedmove.sh right` or `advancedmove.sh left`  
before
```
x y

```
after
```
y x
```
