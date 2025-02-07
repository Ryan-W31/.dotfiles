#!/bin/sh
# time
sketchybar --add item time right                                    \
           --set      time icon=󱑎                                   \
                           icon.color=$LIGHT_ORANGE                       \
                           label="$(date '+%I:%M %p')"              \
                           script='~/.config/sketchybar/plugins/clock.sh'     \
                           update_freq=1

