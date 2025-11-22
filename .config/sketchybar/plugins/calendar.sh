#!/bin/bash

# === Configuration ===
ICS_URL="https://your-calendar-url.com/calendar.ics"
ICS_FILE="calendar.ics"

# source "$HOME/.config/sketchybar/colors.sh"
# Use hardcoded colors
WHITE=0xffe5e9f0  # From colors.sh

# === Initialize arrays ===
declare -a TODAY_EVENTS=()
declare -a TOMORROW_EVENTS=()

# === Download the ICS File ===
# Only download if URL is configured
if [[ "$ICS_URL" != "https://your-calendar-url.com/calendar.ics" ]]; then
  curl -s "$ICS_URL" -o "$ICS_FILE"
  ICS_SUCCESS=$?
else
  ICS_SUCCESS=1  # Failure, since we don't have a real URL
fi

# === Get Today's and Tomorrow's Dates in YYYYMMDD Format ===
TODAY=$(date +"%Y%m%d")
TOMORROW=$(date -v+1d +"%Y%m%d")

# === Parse events only if ICS download was successful ===
if [ $ICS_SUCCESS -eq 0 ]; then
  EVENT_DATE=""
  EVENT_SUMMARY=""

  while IFS= read -r line; do
    # Check for the start of an event
    if [[ "$line" == "BEGIN:VEVENT" ]]; then
      EVENT_DATE=""
      EVENT_SUMMARY=""
    elif [[ "$line" == DTSTART* ]]; then
      # Extract date in YYYYMMDD format
      if [[ "$line" =~ DTSTART[^:]*:([0-9]{8}) ]]; then
        EVENT_DATE="${BASH_REMATCH[1]}"
      elif [[ "$line" =~ DTSTART[^:]*:([0-9]{8})T ]]; then
        EVENT_DATE="${BASH_REMATCH[1]}"
      fi
    elif [[ "$line" == SUMMARY* ]]; then
      # Extract event summary
      EVENT_SUMMARY="${line#SUMMARY:}"
    elif [[ "$line" == "END:VEVENT" ]]; then
      # Check if the event is today or tomorrow
      if [[ "$EVENT_DATE" == "$TODAY" ]]; then
        TODAY_EVENTS+=("$EVENT_SUMMARY")
      fi
      if [[ "$EVENT_DATE" == "$TOMORROW" ]]; then
        TOMORROW_EVENTS+=("$EVENT_SUMMARY")
      fi
    fi
  done <"$ICS_FILE"
fi

# Update the calendar item
sketchybar --set $NAME \
  icon="􀉉 $(date '+%a %d. %b')" \
  label="$(date '+%I:%M %p')" \
  click_script="sketchybar --set $NAME popup.drawing=toggle"

# Always create popup content
sketchybar --remove '/^calendar\.[^ ]+$/' 2>/dev/null

# Always show today's date header
sketchybar --add item calendar.date popup.$NAME \
  --set calendar.date \
  label.color=$WHITE \
  label.font.size=14 \
  label.align=left \
  label="$(date '+%A, %B %d')"

# Show today's events if any
if ((${#TODAY_EVENTS[@]})); then
  index=0
  for today_event in "${TODAY_EVENTS[@]}"; do
    index=$((index + 1))
    sketchybar --add item calendar.event${index} popup.$NAME \
      --set calendar.event${index} \
      label.color=$WHITE \
      label.font="JetBrainsMono Nerd Font:Italic:12.0" \
      label.max_chars=30 \
      scroll_texts=on \
      label.align=center \
      label="$today_event"
  done
else
  # Show no events message
  sketchybar --add item calendar.noevents popup.$NAME \
    --set calendar.noevents \
    label.color=$WHITE \
    label.font="JetBrainsMono Nerd Font:Italic:12.0" \
    label.align=center \
    label="No events today"
fi

# Show tomorrow's events if any
if ((${#TOMORROW_EVENTS[@]})); then
  # Add tomorrow's date header
  sketchybar --add item calendar.date2 popup.$NAME \
    --set calendar.date2 \
    label.color=$WHITE \
    label.font.size=14 \
    label.align=left \
    label="$(date -v+1d '+%A, %B %d')"

  index=0
  for tomorrow_event in "${TOMORROW_EVENTS[@]}"; do
    index=$((index + 1))
    sketchybar --add item calendar.tevent${index} popup.$NAME \
      --set calendar.tevent${index} \
      label.color=$WHITE \
      label.font="JetBrainsMono Nerd Font:Italic:12.0" \
      label.max_chars=30 \
      scroll_texts=on \
      label.align=center \
      label="$tomorrow_event"
  done
fi