#!/usr/bin/env bash

if pgrep -x waybar >/dev/null; then
  pkill waybar
  notify-send -a center_notify "Waybar" "Disabled" -t 2000
else
  waybar &
fi
