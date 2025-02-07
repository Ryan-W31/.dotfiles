#!/bin/sh
sketchybar --add event calevent mouse.clicked
sketchybar --add item calevent right	                            \
           --set      calevent label.padding_left=12                \
                            label="Title"                           \
			    scroll_texts=on                         \
			    scroll_duration=50			    \
                            background.padding_left=0               \
			    icon.color=$YELLOW                      \
                            icon.padding_left=10                    \
                            icon.padding_right=0                    \
                            script='~/.config/sketchybar/plugins/events.sh'   \
                            update_freq=60                          \
                            label.max_chars=20                      

sketchybar --subscribe calevent mouse.clicked

