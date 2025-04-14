#!/bin/bash

SID=$(aerospace list-workspaces --focused)
LENGTH=$(aerospace list-workspaces --all --count)
sketchybar --animate circ 15 --set highlight_space background.padding_left=$((-(LENGTH - (SID - 1)) * 30 + 5))
