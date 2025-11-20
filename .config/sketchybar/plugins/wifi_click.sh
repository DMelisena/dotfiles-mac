#!/bin/sh

source "$CONFIG_DIR/colors.sh"

WIFI_STATUS=$(networksetup -getairportpower en0 | awk '/AirPower/ {print $4}')

if [ "$BUTTON" = "left" ]; then
  if [ "$WIFI_STATUS" = "on" ]; then
    networksetup -setairportpower en0 off
  else
    networksetup -setairportpower en0 on
  fi
fi

# Trigger an update
sketchybar --trigger wifi_change