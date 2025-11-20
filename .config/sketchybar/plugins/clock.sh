#!/bin/sh

source "$CONFIG_DIR/icons.sh"
source "$CONFIG_DIR/colors.sh"

# The $NAME variable is passed from sketchybar and holds the name of
# the item invoking this script:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

# Format: Day Date Time (e.g., "Fri 12-20 14:30")
DATE_FORMAT="$(date '+%a %m-%d %H:%M')"

sketchybar --set "$NAME" \
  icon="$ICON_CLOCK" \
  label="$DATE_FORMAT" \
  icon.color=$COLOR_FOREGROUND \
  label.color=$COLOR_FOREGROUND \
  icon.font="Hack Nerd Font:Bold:17.0" \
  label.font="SF Pro:Semibold:13.0"

