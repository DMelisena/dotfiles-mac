#!/bin/sh

WIFI_STATUS=$(networksetup -getairportpower en0 | awk '{print $NF}')

if [ "$BUTTON" = "left" ] || [ "$BUTTON" = "right" ]; then
  if [ "$WIFI_STATUS" = "On" ]; then
    networksetup -setairportpower en0 off
  else
    networksetup -setairportpower en0 on
  fi

  # Wait a moment for the change to take effect
  sleep 1

  # Trigger WiFi update to show new status
  sketchybar --trigger wifi_change
fi