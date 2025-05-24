#!/bin/bash

# Script to update SketchyBar workspace icons when nodes are moved in AeroSpace
# Place this in your SketchyBar plugins directory

CONFIG_DIR="${CONFIG_DIR:-$HOME/.config/sketchybar}"

# Function to get app icon using the existing icon_map_fn.sh
get_app_icon() {
  local app_name="$1"
  if [ -f "$CONFIG_DIR/plugins/icon_map_fn.sh" ]; then
    "$CONFIG_DIR/plugins/icon_map_fn.sh" "$app_name"
  else
    echo "●" # fallback icon
  fi
}

# Function to update a single workspace
update_workspace() {
  local workspace_id="$1"

  # Get all apps in the workspace
  local apps=$(aerospace list-windows --workspace "$workspace_id" 2>/dev/null | awk -F'|' '{gsub(/^ *| *$/, "", $2); print $2}')

  # Build icon strip
  local icon_strip=""
  if [ -n "$apps" ] && [ "$apps" != "" ]; then
    # Workspace has apps - show it and build icon strip
    sketchybar --set "space.$workspace_id" drawing=on

    icon_strip=" "
    while read -r app; do
      if [ -n "$app" ]; then
        icon_strip+=" $(get_app_icon "$app")"
      fi
    done <<<"$apps"

    sketchybar --set "space.$workspace_id" label="$icon_strip"
  else
    # Workspace is empty
    local focused_workspace=$(aerospace list-workspaces --focused)

    if [ "$workspace_id" = "$focused_workspace" ]; then
      # Keep focused empty workspace visible but with no label
      sketchybar --set "space.$workspace_id" drawing=on label=""
    else
      # Hide non-focused empty workspace
      sketchybar --set "space.$workspace_id" drawing=off label=""
    fi
  fi
}

# Function to update all workspaces
update_all_workspaces() {
  # Get all workspaces for monitor 1 (adjust if you have multiple monitors)
  for workspace_id in $(aerospace list-workspaces --monitor 1 2>/dev/null); do
    update_workspace "$workspace_id"
  done
}

# Main execution
case "${1:-}" in
"update-all")
  update_all_workspaces
  ;;
"update-workspace")
  if [ -n "$2" ]; then
    update_workspace "$2"
  else
    echo "Usage: $0 update-workspace <workspace_id>"
    exit 1
  fi
  ;;
*)
  # Default behavior - update all workspaces
  # This is called when aerospace_workspace_change event is triggered
  update_all_workspaces
  ;;
esac
