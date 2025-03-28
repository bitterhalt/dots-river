#!/usr/bin/env bash

if pgrep -x waybar >/dev/null; then
  killall -q waybar
  notify-send -a center_notify "Bar" "Disabled" -t 1500 -h string:x-canonical-private-synchronous:volume
  # Launch river-tag-overlay when waybar is killed
  ~/.config/river/scripts/river-tag-overlay.sh &
else
  if pgrep -f river-tag-overlay >/dev/null; then
    killall -q river-tag-overlay
  fi
  # Launch waybar when river-tag-overlay is killed
  waybar &
fi
