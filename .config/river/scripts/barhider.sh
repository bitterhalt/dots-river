#!/usr/bin/env bash

if pgrep -x waybar >/dev/null; then
  pkill waybar
  notify-send -a center_notify "Bar" "Disabled" -t 1500 -h string:x-canonical-private-synchronous:volume
else
  waybar &
fi
