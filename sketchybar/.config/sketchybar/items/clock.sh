#!/bin/sh

sketchybar --add item right.time right    \
    --set      right.time icon=󱑎          \
    background.drawing=off \
    icon.color=$RED                 \
    label="$(date '+%I:%M:%S %p')"     \
    label.padding_right=12 \
    background.padding_right=0      \
    update_freq=1                   \
    script='~/.config/sketchybar/plugins/clock.sh'

