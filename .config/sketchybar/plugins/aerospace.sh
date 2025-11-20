#!/usr/bin/env bash

# Simple aerospace workspace manager for Sketchybar
# Only shows workspace numbers, no app icons

WORKSPACE=$1

# Get current focused workspace
FOCUSED=$(aerospace list-workspaces --focused 2>/dev/null)

# Determine if this workspace should be visible and its appearance
if [ "$WORKSPACE" = "$FOCUSED" ]; then
  # Focused workspace - show with Tokyo Night blue background
  sketchybar --set "space.$WORKSPACE" \
    background.color=0xff7aa2f7 \
    background.border_color=0xff7aa2f7 \
    background.border_width=2 \
    icon.color=0xffc0caf5 \
    background.drawing=on
else
  # Non-focused workspace - show with dark background
  sketchybar --set "space.$WORKSPACE" \
    background.color=0xff414868 \
    background.border_color=0xff565f89 \
    background.border_width=1 \
    icon.color=0xff9aa5ce \
    background.drawing=on
fi