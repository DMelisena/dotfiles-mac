#!/usr/bin/env bash

# Simple aerospace workspace manager for Sketchybar
# Only shows workspace numbers, no app icons

WORKSPACE=$1

# Get current focused workspace
FOCUSED=$(aerospace list-workspaces --focused 2>/dev/null)

# Determine if this workspace should be visible and its appearance
if [ "$WORKSPACE" = "$FOCUSED" ]; then
  # Focused workspace - pure white text on medium dark background
  sketchybar --set "space.$WORKSPACE" \
    background.color=0xff404050 \
    background.border_color=0xff7aa2f7 \
    background.border_width=2 \
    icon.color=0xffffffff \
    background.drawing=on
else
  # Non-focused workspace - dark background with dimmer white text
  sketchybar --set "space.$WORKSPACE" \
    background.color=0xff303040 \
    background.border_color=0xff505060 \
    background.border_width=1 \
    icon.color=0xffcccccc \
    background.drawing=on
fi