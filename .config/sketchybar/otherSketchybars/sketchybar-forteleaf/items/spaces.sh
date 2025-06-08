#!/bin/bash
#echo space.sh $'FOCUSED_WORKSPACE': $FOCUSED_WORKSPACE, $'SELECTED': $SELECTED, NAME: $NAME, SENDER: $SENDER  >> ~/aaaa

update() {
  # Listen for both space_change (for initial setup) and aerospace_workspace_change (for workspace switching)
  if [ "$SENDER" = "space_change" ] || [ "$SENDER" = "aerospace_workspace_change" ]; then
    #echo space.sh $'FOCUSED_WORKSPACE': $FOCUSED_WORKSPACE, $'SELECTED': $SELECTED, NAME: $NAME, SENDER: $SENDER, INFO: $INFO  >> ~/aaaa
    #echo $(aerospace list-workspaces --focused) >> ~/aaaa
    source "$CONFIG_DIR/colors.sh"
    COLOR=$BACKGROUND_2

    # For aerospace_workspace_change, use the AEROSPACE_FOCUSED_WORKSPACE variable
    if [ "$SENDER" = "aerospace_workspace_change" ]; then
      CURRENT_WORKSPACE=$AEROSPACE_FOCUSED_WORKSPACE
    else
      # For space_change or other events, get the current workspace
      CURRENT_WORKSPACE=$(aerospace list-workspaces --focused)
    fi

    # Reset all workspace highlights first
    for i in {1..10}; do
      sketchybar --set space.$i icon.highlight=false \
        label.highlight=false \
        background.border_color=$BACKGROUND_2 2>/dev/null
    done

    # Highlight the current workspace
    if [ -n "$CURRENT_WORKSPACE" ]; then
      sketchybar --set space.$CURRENT_WORKSPACE icon.highlight=true \
        label.highlight=true \
        background.border_color=$GREY
    fi

    # Legacy code for backward compatibility
    if [ "$SELECTED" = "true" ]; then
      COLOR=$GREY
    fi
  fi
}

set_space_label() {
  sketchybar --set $NAME icon="$@"
}

mouse_clicked() {
  if [ "$BUTTON" = "right" ]; then
    # yabai -m space --destroy $SID
    echo ''
  else
    if [ "$MODIFIER" = "shift" ]; then
      SPACE_LABEL="$(osascript -e "return (text returned of (display dialog \"Give a name to space $NAME:\" default answer \"\" with icon note buttons {\"Cancel\", \"Continue\"} default button \"Continue\"))")"
      if [ $? -eq 0 ]; then
        if [ "$SPACE_LABEL" = "" ]; then
          set_space_label "${NAME:6}"
        else
          set_space_label "${NAME:6} ($SPACE_LABEL)"
        fi
      fi
    else
      #yabai -m space --focus $SID 2>/dev/null
      #echo space.sh BUTTON: $BUTTON, $'SELECTED': $SELECTED, MODIFIER: $MODIFIER, NAME: $NAME, SENDER: $SENDER, INFO: $INFO, TEST: ${NAME#*.}, ${NAME:6} >> ~/aaaa
      aerospace workspace ${NAME#*.}
    fi
  fi
}

# echo plugin_space.sh $SENDER >> ~/aaaa
case "$SENDER" in
"mouse.clicked")
  mouse_clicked
  ;;
*)
  update
  ;;
esac
