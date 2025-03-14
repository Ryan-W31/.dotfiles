#!/bin/bash

# Add event to subscribe
sketchybar --add event aerospace_workspace_change

# Define your spaces with names and corresponding Nerd Font icons
#SPACES=("Home:H:Home" "Safari:S:Safari" "Ghostty:T:Terminal" "IDEA:I:IntelliJ IDEA" "Slack:S:Slack" "Mail:M:Mail" "Calendar:C:Calendar" "Music:M:Music")
SPACES=("Home:H:Home" "Arc:A:Arc" "Ghostty:T:Terminal" "VSCode:V:VSCode" "Music:M:Music")

# Add and configure spaces
for SPACE in "${SPACES[@]}"; do
  WORKSPACE_NAME=${SPACE%%:*} # Extract name (everything before ':')
  ICON=${SPACE##*:}           # Extract icon (everything after ':')
  # Everything before the first colon


  sketchybar --add item "workspace.$WORKSPACE_NAME" left \
    --subscribe "workspace.$WORKSPACE_NAME" aerospace_workspace_change \
    --set "workspace.$WORKSPACE_NAME" \
    background.padding_left=8 \
    background.padding_right=8 \
    icon.font="sketchybar-app-font:Regular:16.0" \
    icon.padding_left=12 \
    icon.padding_right=12 \
    label.drawing=off \
    label.padding_left=0 \
    label.padding_right=0 \
    script="~/.config/sketchybar/plugins/front_app.sh" \
    icon="$(
      ~/.config/sketchybar/plugins/icon_map_fn.sh "$ICON"
    )" \
    click_script="aerospace workspace $WORKSPACE_NAME" \
    script="~/.config/sketchybar/plugins/aerospace.sh $WORKSPACE_NAME"
done
