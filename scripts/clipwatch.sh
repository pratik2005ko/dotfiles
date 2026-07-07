#!/bin/bash
# Clipboard watcher:
# - Polls PRIMARY selection (selecting text)
# - Copies it to CLIPBOARD (Ctrl+V automatically)
# - Shows notification when text is copied

sleep 2

last_content=""

while true; do
  content=$(wl-paste -p 2>/dev/null)
  if [ -n "$content" ] && [ "$content" != "$last_content" ]; then
    last_content="$content"
    echo "$content" | wl-copy 2>/dev/null
    preview=$(echo "$content" | head -c 120)
    notify-send -t 1200 "📋 Copied" "$preview" 2>/dev/null
  fi
  sleep 0.5
done
