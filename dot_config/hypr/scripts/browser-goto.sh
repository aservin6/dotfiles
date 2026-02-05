#!/bin/sh

URL="https://chatgpt.com"
CLASS="zen" # or chromium, zen, etc

WS=$(hyprctl clients -j | jq -r "
  .[] | select(.class==\"$CLASS\") | .workspace.id
" | head -n 1)

if [ -n "$WS" ]; then
  hyprctl dispatch workspace "$WS"
  zen-browser "$URL"
else
  zen-browser "$URL"
fi
