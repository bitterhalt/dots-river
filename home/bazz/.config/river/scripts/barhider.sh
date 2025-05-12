#!/usr/bin/env bash

# Launch river-tag-overlay when waybar is killed
if pgrep -x waybar >/dev/null; then
  killall -q waybar
  notify-send -t 2000 -a System -i ~/.local/share/icons/feather/x.svg "Bar disabled" -h string:x-canonical-private-synchronous:volume
  # Launch river-tag-overlay when waybar is killed
  ~/.config/river/scripts/river-tag-overlay.sh &
else
  if pgrep -f river-tag-overlay >/dev/null; then
    killall -q river-tag-overlay
  fi
  # Launch waybar when river-tag-overlay is killed
  waybar &
fi
