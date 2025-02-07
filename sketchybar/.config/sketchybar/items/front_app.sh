#!/bin/bash

sketchybar --add item front_app left \
  --set front_app background.color=0x00000000 \
  		  background.drawing=off \
		  icon.drawing=off \
		  label.drawing=off \
  		  icon.font="sketchybar-app-font:Regular:14.0" \
  		  script="~/.config/sketchybar/plugins/front_app.sh" \
  --subscribe front_app front_app_switched
