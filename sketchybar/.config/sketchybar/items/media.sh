#!/bin/sh

sketchybar --add event media_change

sketchybar  --add item  media   left		                \
            --subscribe media   media_change                \
            --set       media   background.padding_left=15  \
			                    icon=󰎇 				        \
			                    icon.color=$LIGHT_PURPLE    \
                                icon.padding_left=12        \
                                icon.padding_right=4        \
                                label="N/A"                 \
                                label.padding_left=4        \
                                label.padding_right=12      \
                                label.max_chars=20			\
                                update_freq=10              \
			                    scroll_texts=on			    \
			                    scroll_duration=50			\
                                script='~/.config/sketchybar/plugins/media.sh'
