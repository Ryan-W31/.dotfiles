#!/bin/bash

# Add event to subscribe
sketchybar --add event aerospace_workspace_change

# Define your spaces with names and corresponding Nerd Font icons
SPACES=("1" "2" "3" "4" "5" "6" "7" "8" "9")

# Add front app name
sketchybar  --add item  workspace.front_app left                    \
            --subscribe workspace.front_app front_app_switched      \
            --set       workspace.front_app icon.drawing=off        \
                                            label.width=100         \
                                            label.align=center      \
                                            label.max_chars=8             \
                                            scroll_texts=on         \
                                            background.drawing=off  \
                                            script="~/.config/sketchybar/plugins/front_app.sh" 

# Add separator icon
sketchybar  --add item  workspace.separator left                    \
            --set       workspace.separator icon=                  \
                                            label.drawing=off       \
                                            background.drawing=off  \
          
# Add spaces
for SPACE in "${SPACES[@]}";
    do
        sketchybar  --add item  "workspace.$SPACE"  left                                 \
                    --subscribe "workspace.$SPACE"  aerospace_workspace_change           \
                    --set       "workspace.$SPACE"                                      \
                                                    icon.font="Zed Mono:Normal:16.0"    \
                                                    icon="$SPACE"                       \
                                                    icon.align=center                   \
                                                    icon.width=30                       \
                                                    icon.y_offset=1                     \
                                                    label.drawing=off                   \
                                                    background.drawing=off              \
                                                    click_script="aerospace workspace $SPACE"
done

# Group spaces in a bracket
sketchybar  --add bracket spaces '/workspace\..*/'

# Add highlight dot
sketchybar  --add item  highlight_space left                            \
            --subscribe highlight_space aerospace_workspace_change      \
            --set       highlight_space width=22                        \
                                        background.color=0xFF31748f     \
                                        background.height=22            \
                                        background.corner_radius=15     \
                                        script='~/.config/sketchybar/plugins/highlight_space.sh'

# Rewrite spaces (will find a better solution later)
for SPACE in "${SPACES[@]}";
    do
        sketchybar  --add item  "workspace_ex.$SPACE"   left                                        \
                    --subscribe "workspace_ex.$SPACE"   aerospace_workspace_change                  \
                    --set       "workspace_ex.$SPACE"                                               \
                                                        icon.font="Zed Mono:Bold:16.0" 		        \
                                                        icon="$SPACE"                               \
                                                        icon.align=center                           \
                                                        icon.width=30                               \
                                                        icon.y_offset=1                             \
                                                        label.drawing=off                           \
                                                        background.drawing=off                      \
                                                        click_script="aerospace workspace $SPACE"   \
                                                        script="~/.config/sketchybar/plugins/aerospace.sh $SPACE"
done
sketchybar --set workspace_ex.1 padding_left=-292

