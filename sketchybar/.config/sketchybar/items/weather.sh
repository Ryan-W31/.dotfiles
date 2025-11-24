#!/bin/sh

sketchybar --add item right.weather right \
    --set      right.weather icon=A       \
    background.drawing=off \
    icon.color=$LIGHT_BLUE          \
    label="--°F"                    \
    update_freq=60                  \
    script='~/.config/sketchybar/plugins/weather.sh'

