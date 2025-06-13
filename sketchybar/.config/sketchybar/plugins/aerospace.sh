#!/bin/bash

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --animate linear 15 --set "$NAME"    \
        icon.color=0xFFe0def4                       \
else
    sketchybar --animate linear 15 --set "$NAME"    \
        icon.color=0xFFe0def4
fi
