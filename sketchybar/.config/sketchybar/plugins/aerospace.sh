#!/bin/bash

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --animate linear 15 --set "$NAME"    \
        icon.color=0xFFC0CAF5                       \
        icon.color=0xFF1A1B26 
else
    sketchybar --animate linear 15 --set "$NAME"    \
        icon.color=0xFFC0CAF5
fi
