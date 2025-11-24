#!/bin/bash

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    #sketchybar --animate linear 15 --set "$NAME"    \
    sketchybar --set "$NAME" icon.color=0xFFEB6F92
else
    #sketchybar --animate linear 15 --set "$NAME"    \
    sketchybar --set "$NAME" icon.color=0xFFE0DEF4
fi
