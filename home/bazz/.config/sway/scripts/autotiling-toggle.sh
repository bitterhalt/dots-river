#!/usr/bin/env bash

if pgrep autotiling >/dev/null; then
  pkill autotiling
  notify-send -a Sway "Autotiling" "Disabled" -t 1500 -h string:x-canonical-private-synchronous:volume
else
  autotiling &
  notify-send -a Sway "Autotiling" "Enabled" -t 1500 -h string:x-canonical-private-synchronous:volume
fi
