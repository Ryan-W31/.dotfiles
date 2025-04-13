#!/bin/sh

sketchybar --add item weather right                 \
           --set      weather icon=A                \
                              icon.color=$LIGHT_TEAL\
                              label="--°F"          \
                              update_freq=60        \
                              script='~/.config/sketchybar/plugins/weather.sh'

