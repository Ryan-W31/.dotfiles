#!/bin/sh

text="$(python3 ~/.config/sketchybar/plugins/upcoming_events.py calendar)"

if [ "$text" = "No Upcoming" ]; then
    sketchybar --set "$NAME" icon="󱁖" label="$text"
else
    sketchybar --set "$NAME" icon="󰃶" label="$text"
fi
