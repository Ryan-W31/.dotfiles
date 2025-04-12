#!/bin/bash

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
  sketchybar --set "$NAME"  \
    icon.color=0xFFFFC66D   \
    icon.font="Zed Mono:Bold:16.0"
else
  sketchybar --set "$NAME"  \
    icon.color=0xFFC0CAF5   \
    icon.font="Zed Mono:Normal:16.0"
fi
