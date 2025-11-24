#!/bin/sh

sketchybar --add item right.battery right \
    --set      right.battery icon=       \
    background.drawing=off \
    icon.color=$LIGHT_BLUE          \
    icon.padding_left=12 \
    label="--%"                     \
    update_freq=20                  \
    script="~/.config/sketchybar/plugins/battery.sh"

