#!/bin/sh

source "$CONFIG_DIR/icons.sh"
source "$CONFIG_DIR/colors.sh"

PERCENTAGE="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
CHARGING="$(pmset -g batt | grep 'AC Power')"

if [ "$PERCENTAGE" = "" ]; then
  exit 0
fi

# Battery icons based on percentage
case "${PERCENTAGE}" in
  9[0-9]|100)
    ICON=""
    ;;
  [6-8][0-9])
    ICON=""
    ;;
  [3-5][0-9])
    ICON=""
    ;;
  [1-2][0-9])
    ICON=""
    ;;
  *)
    ICON=""
    ;;
esac

if [[ "$CHARGING" != "" ]]; then
  ICON=""
fi

# Only change color to red when under 20%
if [ "${PERCENTAGE}" -lt 20 ]; then
  COLOR=$COLOR_RED
else
  COLOR=$COLOR_FOREGROUND
fi

sketchybar --set "$NAME" icon="$ICON" label="${PERCENTAGE}%" icon.color=$COLOR label.color=$COLOR