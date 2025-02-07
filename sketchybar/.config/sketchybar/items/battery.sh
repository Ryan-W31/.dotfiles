#!/bin/sh

# battery
sketchybar --add item battery right                                 \
           --set      battery icon=                                \
                              icon.color=$LIGHT_GREEN               \
                              label="--%"                           \
                              script="~/.config/sketchybar/plugins/battery.sh" \
                              update_freq=20

