#!/bin/sh

sketchybar --add item battery right \
    --set      battery icon=       \
    icon.color=$LIGHT_BLUE          \
    label="--%"                     \
    update_freq=20                  \
    script="~/.config/sketchybar/plugins/battery.sh"

