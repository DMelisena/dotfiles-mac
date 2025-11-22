#!/bin/bash
sketchybar --add item calendar right \
  --set calendar icon=􀉉 \
  update_freq=1 \
  script=$PLUGIN_DIR/calendar.sh \
  label="$(/bin/bash -c "date '+%a %d. %b %I:%M %p'")" \
  background.height=25 \
  click_script="sketchybar --set calendar popup.drawing=toggle" \
  popup.drawing=off \
  padding_left=0 \
  padding_right=0 \
  background.color=0xff232136

sketchybar --set calendar popup.background.border_width=2 \
  popup.background.corner_radius=5 \
  popup.background.border_color=$WHITE \
  popup.background.color=$DARK_BG \
  popup.height=0
