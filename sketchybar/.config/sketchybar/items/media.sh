#!/bin/sh

sketchybar --add event media_change
sketchybar --add item media left		                                \
           --set      media label.padding_left=12                   \
                            label="N/A"                             \
                            background.padding_left=8               \
			                      icon=󰎇 				                          \
			                      icon.color=$LIGHT_PURPLE			          \
                            icon.padding_left=10                    \
                            icon.padding_right=0                    \
                            script='~/.config/sketchybar/plugins/media.sh'   \
                            update_freq=10                          \
			                      scroll_texts=on			                    \
			                      scroll_duration=50			                \
                            label.max_chars=20			    

sketchybar --subscribe media media_change
