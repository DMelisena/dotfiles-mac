#!/bin/sh

source "$CONFIG_DIR/icons.sh"
source "$CONFIG_DIR/colors.sh"

# Get full application name using AppleScript
get_app_name() {
  osascript -e 'tell application "System Events"
    set frontApp to first application process whose frontmost is true
    set appName to name of frontApp
    return appName
  end tell' 2>/dev/null
}

case "$SENDER" in
"front_app_switched"|"forced")
  # Get app name
  APP_NAME=$(get_app_name)

  # Get app icon using our icon mapping
  APP_ICON=$("$CONFIG_DIR/plugins/icon_map_fn.sh" "$APP_NAME")

  if [ -n "$APP_NAME" ]; then
    sketchybar --set "$NAME" \
      icon="$APP_ICON" \
      label="$APP_NAME" \
      icon.color=$COLOR_FOREGROUND \
      label.color=$COLOR_FOREGROUND \
      icon.drawing=on
  fi
  ;;
esac