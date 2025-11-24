#!/bin/sh

sketchybar --add item right.date right \
    --set      right.date icon=󱨰       \
    background.drawing=off \
    icon.color=$YELLOW           \
    label="$(date '+%a %b %d')"  \
    updates=on                   \
    update_freq=10               \
    script='~/.config/sketchbar/plugins/date.sh'

