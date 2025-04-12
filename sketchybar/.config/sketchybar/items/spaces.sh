#!/bin/bash

# Add event to subscribe
sketchybar --add event aerospace_workspace_change

# Define your spaces with names and corresponding Nerd Font icons
SPACES=("1" "2" "3" "4" "5" "6" "7" "8" "9")
# Add and configure spaces
for SPACE in "${SPACES[@]}";
    do
        sketchybar --add item "workspace.$SPACE" left                   \
            --subscribe "workspace.$SPACE" aerospace_workspace_change   \
            --set "workspace.$SPACE"                                    \
            script="~/.config/sketchybar/plugins/aerospace.sh $SPACE"   \
            icon.font="Zed Mono:Bold:16.0" 		                        \
            icon="$SPACE"                                               \
            icon.padding_right=12                                       \
            icon.width=30                                               \
            icon.y_offset=1                                             \
            label.drawing=off                                           \
            background.drawing=off                                      \
            click_script="aerospace workspace $SPACE"
done

sketchybar --add bracket spaces '/workspace\..*/'
