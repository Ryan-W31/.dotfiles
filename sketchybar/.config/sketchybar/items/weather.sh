#!/bin/sh

# weather
sketchybar --add item weather right                                 \
           --set      weather icon=A                                \
                              icon.color=$LIGHT_TEAL                \
                              label="--°F"                          \
                              script='~/.config/sketchybar/plugins/weather.sh'   \
                              update_freq=60

