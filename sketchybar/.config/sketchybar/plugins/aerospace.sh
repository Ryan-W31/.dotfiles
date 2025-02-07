#!/bin/bash

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
  sketchybar --set "$NAME" \
    background.color=0xFFC0CAF5 \
    icon.color=0xFF1A1B26
else
  sketchybar --set "$NAME" \
    icon.color=0xFFC0CAF5 \
    background.color=0xFF1A1B26
fi
