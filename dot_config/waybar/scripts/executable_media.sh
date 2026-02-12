#!/usr/bin/env bash

player_status=$(playerctl status 2>/dev/null)

if [[ "$player_status" == "Playing" || "$player_status" == "Paused" ]]; then
  artist=$(playerctl metadata artist 2>/dev/null)
  title=$(playerctl metadata title 2>/dev/null)

  if [[ "$player_status" == "Playing" ]]; then
    icon="󰎆"
  else
    icon="󰏤"
  fi

  echo "{\"text\": \"$artist - $title\", \"icon\": \"$icon\", \"class\": \"playing\"}"
else
  echo ""
fi
