#!/bin/sh

source "$CONFIG_DIR/icons.sh"
source "$CONFIG_DIR/colors.sh"

# Get battery percentage more robustly
# Extract the percentage
BATT_OUTPUT=$(pmset -g batt)
PERCENTAGE=$(echo "$BATT_OUTPUT" | grep -o '[0-9]*%' | head -1 | tr -d '%')
CHARGING=$(echo "$BATT_OUTPUT" | grep -c 'AC Power')

# Fallback method if the above fails
if [ -z "$PERCENTAGE" ] || [ "$PERCENTAGE" = "" ]; then
  PERCENTAGE=$(echo "$BATT_OUTPUT" | grep -o '[0-9]*%' | head -1 | tr -d '%')
fi

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

if [ "$CHARGING" -gt 0 ]; then
  ICON=""
fi

# Only change color to red when under 20%
if [ "${PERCENTAGE}" -lt 20 ]; then
  COLOR=$COLOR_RED
else
  COLOR=$COLOR_FOREGROUND
fi

sketchybar --set "$NAME" icon="$ICON" label="${PERCENTAGE}%" icon.color=$COLOR label.color=$COLOR