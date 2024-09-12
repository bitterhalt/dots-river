#!/usr/bin/env bash

if pgrep waybar >/dev/null; then
  pkill waybar
  notify-send -a center_notify "Waybar" "Disabled" -t 1500 -h string:x-canonical-private-synchronous:volume
else
  waybar &
fi
