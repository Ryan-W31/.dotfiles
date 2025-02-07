#!/bin/bash

# Add the Apple logo item to the left side
sketchybar \
  --add item apple.logo left \
  --set apple.logo icon=􀣺 \
  background.padding_right=8 \
  icon.padding_right=12 \
  icon.font="SF Pro:Heavy:16" \
  label.drawing=off \
  popup.height=40 \
  click_script="sketchybar -m --set \$NAME popup.drawing=toggle"

# Set default padding for items
sketchybar \
  --default background.padding_left=5 \
  background.padding_right=5 \
  icon.padding_right=5

# Add the Sleep item to the popup menu
sketchybar \
  --add item apple.sleep popup.apple.logo \
  --set apple.sleep icon=󰒲 \
  icon.font.size=14 \
  label="Sleep" \
  click_script="sketchybar -m --set apple.logo popup.drawing=off; osascript -e 'tell application \"System Events\" to sleep';"
                                   

# Add the Restart item to the popup menu
sketchybar \
  --add item apple.restart popup.apple.logo \
  --set apple.restart icon=󰜉 \
  icon.font.size=14 \
  label="Restart" \
  click_script="sketchybar -m --set apple.logo popup.drawing=off; osascript -e 'tell app \"loginwindow\" to «event aevtrrst»';"

# Add the Shut Down item to the popup menu
sketchybar \
  --add item apple.shutdown popup.apple.logo \
  --set apple.shutdown icon=󰐥 \
  icon.font.size=14 \
  label="Shut Down" \
  click_script="sketchybar -m --set apple.logo popup.drawing=off; osascript -e 'tell app \"loginwindow\" to «event aevtrsdn»';"
