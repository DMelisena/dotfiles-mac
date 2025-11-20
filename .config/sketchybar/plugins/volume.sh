#!/bin/sh

source "$CONFIG_DIR/icons.sh"
source "$CONFIG_DIR/colors.sh"

# The volume_change event supplies a $INFO variable in which the current volume
# percentage is passed to the script.

if [ "$SENDER" = "volume_change" ]; then
  VOLUME="$INFO"

  case "$VOLUME" in
  [6-9][0-9] | 100)
    ICON="󰕾"
    COLOR=$COLOR_GREEN
    ;;
  [3-5][0-9])
    ICON="󰖀"
    COLOR=$COLOR_FOREGROUND
    ;;
  [1-9] | [1-2][0-9])
    ICON="󰕿"
    COLOR=$COLOR_YELLOW
    ;;
  *)
    ICON="󰖁"
    COLOR=$COLOR_RED
    ;;
  esac

  sketchybar --set "$NAME" \
    icon="$ICON" \
    label="$VOLUME%" \
    icon.color=$COLOR \
    label.color=$COLOR \
    icon.font="Hack Nerd Font:Bold:20.0" \
    label.font="SF Pro:Semibold:16.0" \
    icon.y_offset=0 \
    label.y_offset=0
fi

