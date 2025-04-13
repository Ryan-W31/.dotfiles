#!/bin/sh

sketchybar --add item time right                        \
           --set      time icon=󱑎                       \
                           icon.color=$LIGHT_ORANGE     \
                           label="$(date '+%I:%M %p')"  \
                           background.padding_right=0   \
                           update_freq=1                \
                           script='~/.config/sketchybar/plugins/clock.sh'

