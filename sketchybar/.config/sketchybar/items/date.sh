#!/bin/sh

# date
sketchybar --add item date right                                    \
           --set      date icon=󱨰                                   \
                           icon.color=$LIGHT_YELLOW                    \
                           label="$(date '+%a %b %d')"              \
                           script='~/.config/sketchbar/plugins/date.sh' \
                           updates=on                               \
                           update_freq=10

