#!/bin/bash

# Enhanced aerospace.sh plugin for SketchyBar
# Place this in ~/.config/sketchybar/plugins/aerospace.sh

# This script is called for each workspace item when aerospace_workspace_change event is triggered

CONFIG_DIR="${CONFIG_DIR:-$HOME/.config/sketchybar}"
WORKSPACE_ID="$1"

if [ -z "$WORKSPACE_ID" ]; then
  exit 1
fi

# Get current focused workspace
FOCUSED_WORKSPACE="$AEROSPACE_FOCUSED_WORKSPACE"
if [ -z "$FOCUSED_WORKSPACE" ]; then
  FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused 2>/dev/null)
fi

# Function to get app icon
get_app_icon() {
  local app_name="$1"
  if [ -f "$CONFIG_DIR/plugins/icon_map_fn.sh" ]; then
    "$CONFIG_DIR/plugins/icon_map_fn.sh" "$app_name"
  else
    echo "●"
  fi
}

# Get apps in this workspace
APPS=$(aerospace list-windows --workspace "$WORKSPACE_ID" 2>/dev/null | awk -F'|' '{gsub(/^ *| *$/, "", $2); print $2}')

# Build icon strip
ICON_STRIP=""
if [ -n "$APPS" ] && [ "$APPS" != "" ]; then
  ICON_STRIP=" "
  while read -r app; do
    if [ -n "$app" ]; then
      ICON_STRIP+=" $(get_app_icon "$app")"
    fi
  done <<<"$APPS"
fi

# Determine if this workspace should be visible
SHOULD_DRAW="off"
if [ "$WORKSPACE_ID" = "$FOCUSED_WORKSPACE" ] || [ -n "$APPS" ]; then
  SHOULD_DRAW="on"
fi

# Set colors based on focus state
if [ "$WORKSPACE_ID" = "$FOCUSED_WORKSPACE" ]; then
  # Focused workspace
  BG_COLOR="0x44ffffff"
  BORDER_WIDTH="2"
  BORDER_COLOR="0xAAFFFFFF"
else
  # Unfocused workspace
  BG_COLOR="0x22ffffff"
  BORDER_WIDTH="0"
  BORDER_COLOR="0x44ffffff"
fi

# Update the workspace item
sketchybar --set "space.$WORKSPACE_ID" \
  drawing="$SHOULD_DRAW" \
  label="$ICON_STRIP" \
  background.color="$BG_COLOR" \
  background.border_width="$BORDER_WIDTH" \
  background.border_color="$BORDER_COLOR"

