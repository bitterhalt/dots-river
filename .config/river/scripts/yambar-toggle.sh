#!/usr/bin/env bash

if pgrep -x yambar >/dev/null; then
  pkill yambar
  notify-send -a center_notify "Status Bar" "Disabled" -t 2000
else
  yambar &
fi
