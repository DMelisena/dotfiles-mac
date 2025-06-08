SSID=$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk -F: '($1 ~ "^ *SSID$"){print $2}' | cut -c 2-)

sketchybar --set $NAME \
  icon= icon.color=0xFFFEFEFE \
  label="$SSID"
#!/bin/sh

# The wifi_change event supplies information about the network connection.

# update() {
#   # Source icons from the config directory
#   source "$CONFIG_DIR/icons.sh"
#
#   # Get SSID and IP address
#   SSID="$(/System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -I | awk -F ' SSID: ' '/ SSID: / {print $2}')"
#   IP="$(ipconfig getifaddr en0)"
#
#   # Determine icon and label based on connection status
#   ICON="$([ -n "$IP" ] && echo "$WIFI_CONNECTED" || echo "$WIFI_DISCONNECTED")"
#   LABEL="$([ -n "$IP" ] && echo "$SSID ($IP)" || echo "Disconnected")"
#
#   # Update sketchybar
#   sketchybar --set "$NAME" icon="􀙇" label="$LABEL"
# }
# # WIFI_CONNECTED=􀙇
# # WIFI_DISCONNECTED=􀙈
# # ETHERNET_CONNECTED=󰈀
#
# click() {
#   # Get current label width
#   CURRENT_WIDTH="$(sketchybar --query "$NAME" | jq -r .label.width)"
#
#   # Toggle label width between 0 and dynamic
#   WIDTH=0
#   if [ "$CURRENT_WIDTH" -eq "0" ]; then
#     WIDTH=dynamic
#   fi
#
#   # Animate the label width change
#   sketchybar --animate sin 20 --set "$NAME" label.width="$WIDTH"
# }
#
# case "$SENDER" in
# "wifi_change")
#   update
#   ;;
# "mouse.clicked")
#   click
#   ;;
# esac
#
# # update() {
# #
# #   source "$CONFIG_DIR/icons.sh"
# #   SSID="$(/System/Library/PrivateFrameworks/Apple80211.framework/Resources/airport -I | awk -F ' SSID: '  '/ SSID: / {print $2}')"
# #   IP="$(ipconfig getifaddr en0)"
# #
# #   ICON="$([ -n "$IP" ] && echo "$WIFI_CONNECTED" || echo "$WIFI_DISCONNECTED")"
# #   LABEL="$([ -n "$IP" ] && echo "$SSID ($IP)" || echo "Disconnected")"
# #
# #   sketchybar --set $NAME icon="$ICON" label="$LABEL"
# # }
# #
# # click() {
# #   CURRENT_WIDTH="$(sketchybar --query $NAME | jq -r .label.width)"
# #
# #   WIDTH=0
# #   if [ "$CURRENT_WIDTH" -eq "0" ]; then
# #     WIDTH=dynamic
# #   fi
# #
# #   sketchybar --animate sin 20 --set $NAME label.width="$WIDTH"
# # }
# # case "$SENDER" in
# #   "wifi_change") update
# #   ;;
# #   "mouse.clicked") click
# #   ;;
# # esac
# #
# # if [ "$SENDER" = "wifi_change" ]; then
# #   update
# #
# #   sketchybar --set "$NAME" icon="$ICON" label="$VOLUME%"
# # fi
