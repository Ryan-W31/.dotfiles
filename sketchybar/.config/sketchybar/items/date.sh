#!/bin/sh

sketchybar --add item date right                        \
           --set      date icon=󱨰                       \
                           icon.color=$LIGHT_RED        \
                           label="$(date '+%a %b %d')"  \
                           updates=on                   \
                           update_freq=10               \
                           script='~/.config/sketchbar/plugins/date.sh'

