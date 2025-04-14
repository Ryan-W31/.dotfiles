#!/bin/bash

# Add the Apple logo item to the left side
sketchybar  --add item  apple.logo  left                        \
            --set       apple.logo  icon=􀣺                      \
                                    icon.align=center           \
                                    icon.width=50               \
                                    label.drawing=off           \
                                    background.padding_right=15 \
                                    popup.height=40             \
                                    click_script="sketchybar --set \$NAME popup.drawing=toggle"

# Add the Sleep item to the popup menu
sketchybar  --add item  apple.sleep popup.apple.logo        \
            --set       apple.sleep icon=󰒲                  \
                                    icon.align=right        \
                                    icon.padding_left=12    \
                                    icon.padding_right=4    \
                                    label="Sleep"           \
                                    label.align=right       \
                                    label.padding_left=4    \
                                    label.padding_right=12  \
                                    click_script="sketchybar -m --set apple.logo popup.drawing=off; osascript -e 'tell application \"System Events\" to sleep';"
                                   

# Add the Restart item to the popup menu
sketchybar  --add item  apple.restart   popup.apple.logo        \
            --set       apple.restart   icon=󰜉                  \
                                        icon.align=left         \
                                        icon.padding_left=12    \
                                        icon.padding_right=4    \
                                        label="Restart"         \
                                        label.align=right       \
                                        label.padding_left=4    \
                                        label.padding_right=12  \
                                        click_script="sketchybar -m --set apple.logo popup.drawing=off; osascript -e 'tell app \"loginwindow\" to «event aevtrrst»';"

# Add the Shut Down item to the popup menu
sketchybar  --add item  apple.shutdown  popup.apple.logo        \
            --set       apple.shutdown  icon=󰐥                  \
                                        icon.align=left         \
                                        icon.padding_left=12    \
                                        icon.padding_right=4    \
                                        label="Shut Down"       \
                                        label.align=right       \
                                        label.padding_left=4    \
                                        label.padding_right=12  \
                                        click_script="sketchybar -m --set apple.logo popup.drawing=off; osascript -e 'tell app \"loginwindow\" to «event aevtrsdn»';"
