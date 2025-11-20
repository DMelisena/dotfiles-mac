#!/bin/bash

# Icon Map Function - Returns actual Unicode/Nerd Font icons

icon_map() {
  case "$1" in
  "Firefox" | "firefox" | "Firefox Developer Edition" | ":firefox:")
    icon_result="󰈹"
    ;;
  "Google Chrome" | "Chrome" | "chromium")
    icon_result="󰊯"
    ;;
  "Safari" | "Safari Technology Preview")
    icon_result="󰖟"
    ;;
  "kitty" | "Kitty" | ":kitty:")
    icon_result="󰄛"
    ;;
  "Alacritty")
    icon_result="󰆍"
    ;;
  "Terminal")
    icon_result="󰆍"
    ;;
  "iTerm2" | "iTerm")
    icon_result="󰆍"
    ;;
  "Visual Studio Code" | "Code" | "code")
    icon_result="󰨞"
    ;;
  "Neovim" | "nvim" | "Neovide")
    icon_result=""
    ;;
  "Sublime Text")
    icon_result="󰅪"
    ;;
  "Slack")
    icon_result="󰒱"
    ;;
  "Discord")
    icon_result="󰙯"
    ;;
  "Spotify")
    icon_result="󰓇"
    ;;
  "Music")
    icon_result="󰈚"
    ;;
  "Mail")
    icon_result="󰇮"
    ;;
  "Calendar")
    icon_result="󰃭"
    ;;
  "Notes")
    icon_result="󰍬"
    ;;
  "Photos")
    icon_result="󰈏"
    ;;
  "Finder")
    icon_result="󰀶"
    ;;
  "System Settings" | "System Preferences")
    icon_result="󰒓"
    ;;
  "Activity Monitor")
    icon_result="󰍛"
    ;;
  "Arc")
    icon_result="󰅰"
    ;;
  "Brave")
    icon_result="󰊯"
    ;;
  "Vivaldi")
    icon_result="󰊯"
    ;;
  "Telegram")
    icon_result="󰈨"
    ;;
  "WhatsApp")
    icon_result="󰈈"
    ;;
  "Signal")
    icon_result="󰈉"
    ;;
  "Zoom")
    icon_result="󰤝"
    ;;
  "Skype")
    icon_result="󰈀"
    ;;
  "Figma")
    icon_result="󰙩"
    ;;
  "Sketch")
    icon_result="󰈉"
    ;;
  "Microsoft Word")
    icon_result="󰊄"
    ;;
  "Microsoft Excel")
    icon_result="󰈛"
    ;;
  "Microsoft PowerPoint")
    icon_result="󰈧"
    ;;
  "Microsoft Teams")
    icon_result="󰊻"
    ;;
  "Thunderbird")
    icon_result="󰇮"
    ;;
  "Emacs")
    icon_result=""
    ;;
  "Vim")
    icon_result=""
    ;;
  "Atom")
    icon_result="󰅪"
    ;;
  "IntelliJ IDEA" | "PyCharm" | "WebStorm" | "CLion")
    icon_result=""
    ;;
  "VLC")
    icon_result="󰕼"
    ;;
  "IINA")
    icon_result="󰈫"
    ;;
  "Steam")
    icon_result="󰓓"
    ;;
  "1Password")
    icon_result="󰌋"
    ;;
  "Bitwarden")
    icon_result="󰏇"
    ;;
  "Dropbox")
    icon_result="󰅪"
    ;;
  "Google Drive")
    icon_result="󰈊"
    ;;
  "Transmit" | "Cyberduck" | "FileZilla")
    icon_result="󰇀"
    ;;
  "Notion")
    icon_result="󰈇"
    ;;
  "Obsidian")
    icon_result="󰠮"
    ;;
  "Bear")
    icon_result="󰅱"
    ;;
  "Things" | "Todoist")
    icon_result="󰗔"
    ;;
  "Preview")
    icon_result="󰈏"
    ;;
  "TextEdit")
    icon_result="󰈙"
    ;;
  "QuickTime Player")
    icon_result="󰕸"
    ;;
  "Dictionary")
    icon_result="󰗊"
    ;;
  "Calculator")
    icon_result="󰃬"
    ;;
  "Camera")
    icon_result="󰄀"
    ;;
  "Photo Booth")
    icon_result="󰴸"
    ;;
  "Voice Memos")
    icon_result="󰈊"
    ;;
  "Maps")
    icon_result="󰆆"
    ;;
  "Weather")
    icon_result="󰖨"
    ;;
  "News")
    icon_result="󰂪"
    ;;
  "Stocks")
    icon_result="󰈝"
    ;;
  "Home")
    icon_result="󰋜"
    ;;
  "Books")
    icon_result="󰂺"
    ;;
  "Podcasts")
    icon_result="󰦎"
    ;;
  "TV")
    icon_result="󰄠"
    ;;
  "Clock")
    icon_result="󰥔"
    ;;
  "Contacts")
    icon_result="󰍦"
    ;;
  "FaceTime")
    icon_result="󰍽"
    ;;
  "Messages")
    icon_result="󰍯"
    ;;
  "Phone")
    icon_result="󰏩"
    ;;
  "App Store")
    icon_result="󰇳"
    ;;
  "Bluetooth Explorer")
    icon_result="󰂯"
    ;;
  "Keychain Access")
    icon_result="󰌋"
    ;;
  "Console")
    icon_result="󰋛"
    ;;
  "Disk Utility")
    icon_result="󰋊"
    ;;
  "Network Utility")
    icon_result="󰖩"
    ;;
  "Script Editor")
    icon_result="󰅺"
    ;;
  "Automator")
    icon_result="󰛸"
    ;;
  "Shortcuts")
    icon_result="󰅱"
    ;;
  "Activity Monitor")
    icon_result="󰍛"
    ;;
  "Energy Saver")
    icon_result="󰾏"
    ;;
  "Network")
    icon_result="󰖩"
    ;;
  "Sound")
    icon_result="󰕾"
    ;;
  "Displays")
    icon_result="󰹹"
    ;;
  "Keyboard")
    icon_result="󰌌"
    ;;
  "Trackpad")
    icon_result="󰍽"
    ;;
  "Mouse")
    icon_result="󰍽"
    ;;
  *)
    # Default icon for unknown apps
    icon_result="󰀻"
    ;;
  esac
}

# Handle both old format calls and direct calls
if [[ "$1" == *":"* ]]; then
  # Remove colons if present (e.g., :firefox: -> firefox)
  app_name=$(echo "$1" | tr -d ':')
  icon_map "$app_name"
else
  # Direct call with app name
  icon_map "$1"
fi

echo "$icon_result"