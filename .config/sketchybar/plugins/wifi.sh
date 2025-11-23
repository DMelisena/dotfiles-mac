#!/bin/sh

# Get WiFi status and SSID
WIFI_STATUS=$(networksetup -getairportpower en0 | awk '{print $NF}')
WIFI_SSID=$(ipconfig getsummary en0 | awk -F' SSID : ' '/ SSID : / {print $2}')

# Check if WiFi is on and connected
if [ "$WIFI_STATUS" = "On" ] && [ -n "$WIFI_SSID" ]; then
  sketchybar --set "$NAME" icon="󰖩" label="$WIFI_SSID" icon.color=0xffffffff label.color=0xffffffff label.drawing=off
else
  sketchybar --set "$NAME" icon="󰖩" label="Off" icon.color=0xa9a9a9a9 label.color=0xffbf616a label.drawing=off icon.font.size=18
  #󰖪
fi

